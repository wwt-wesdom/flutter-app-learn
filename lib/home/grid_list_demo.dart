import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:dio/dio.dart';
import '../api/index.dart';
import 'package:flutter_app/blocs/grid_list_bloc.dart';

class GridListDemo extends StatefulWidget {
  @override
  _GridListDemoState createState() => _GridListDemoState();
}
/*

class ProductItem {
  final String name;
  final String asset;
  ProductItem({this.name,this.asset});
}
*/

Widget _buildItemGrid(ProductItem product) {
  return Padding(
    padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
    child: Card(
      color: Colors.white,
      child: Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.only(top: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ClipRRect(
              child: SizedBox(
                width: 120.0,
                height: 120.0,
                child: FadeInImage.assetNetwork(
                  placeholder: 'assets/images/glnz.jpg',
                  image: product.asset,
                  fit: BoxFit.fill,
                ),
              ),
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
            Container(
              height: 10.0,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: 6.0, left: 3.0, right: 3.0),
                child: Text(
                  product.name,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

class _GridListDemoState extends State<GridListDemo> {
  GridList bloc;
  List<ProductItem> _products = [];
  bool noMoreData = true;
  bool loading = true;
  bool showToTop = false;
  List<ProductItem> _productsTwo = [
    ProductItem(
      name: 'Bueno Chocolate',
      asset: 'assets/images/food01.jpeg',
    ),
    ProductItem(
      name: 'Chocolate with berries',
      asset: 'assets/images/food02.jpeg',
    ),
    ProductItem(
      name: 'Trumoo Candies',
      asset: 'assets/images/food03.jpeg',
    ),
    ProductItem(
      name: 'Choco-coko',
      asset: 'assets/images/food04.jpeg',
    ),
    ProductItem(
      name: 'Chocolate tree',
      asset: 'assets/images/food05.jpeg',
    ),
    ProductItem(
      name: 'Chocolate',
      asset: 'assets/images/food06.jpeg',
    ),
    ProductItem(
      name: 'Bueno Chocolate',
      asset: 'assets/images/food01.jpeg',
    ),
    ProductItem(
      name: 'Choco-coko',
      asset: 'assets/images/food04.jpeg',
    ),
    ProductItem(
      name: 'Chocolate tree',
      asset: 'assets/images/food05.jpeg',
    ),
    ProductItem(
      name: 'Chocolate tree',
      asset: 'assets/images/food05.jpeg',
    ),
  ];
  int pageIndex = 1;
  ScrollController _controller = ScrollController();

  Future moreList() async {
    setState(() {
      pageIndex++;
    });
    getDate();
  }

  Future onRefresh() async {
    setState(() {
      pageIndex = 1;
      _products = [];
    });
    getDate();
  }

  getDate() {
    /*setState(() {
      _products.addAll(_productsTwo);
    });*/
    dioText();
  }

  void dioText() async {
    Dio dio = Dio();
    setState(() {
      loading = false;
      noMoreData = true;
    });
    ApiConfig.getProductList({
      "q": "",
      "page": pageIndex,
      "pageSize": 10,
      "cid": 1001,
      "has_coupon": true,
      "start_price": "",
      "end_price": "",
      "need_free_shipment": "",
      "sort": "total_sales_des",
    }).then((res) {
      if (res.data.data != null && res.data.data['data'].length > 0) {
        List listData = res.data.data['data'];
        listData.forEach((item) {
          _products
              .add(ProductItem(name: item['title'], asset: item['picUrl']));
        });
        setState(() {
          _products = _products;
          loading = true;
        });
      } else {
        setState(() {
          loading = true;
          noMoreData = false;
        });
      }
    });
  }

  void initState() {
    super.initState();
    bloc = GridList();
    int pageIndex = 1;
    bloc.getGridList(pageIndex);
    toList();
    getDate();
    _controller.addListener(() {
      if (_controller.position.pixels == _controller.position.maxScrollExtent) {
        bloc.getGridList(pageIndex++);
      }
      if (_controller.offset >= 500) {
        if (!showToTop) {
          showToTop = true;
          bloc.changeData(true);
        }
      } else {
        if (showToTop) {
          showToTop = false;
          bloc.changeData(false);
        }
      }
    });
  }

  void toList() {
    var list = '["1","2"]';
    var decoded = json.decode(list);
  }

  @override
  void dispose() {
    //为了避免内存泄露，需要调用_controller.dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: bloc.gridListStream,
        builder: (BuildContext context, AsyncSnapshot<ResMap> snapshot) {
          print(snapshot.data != null ? snapshot.data.goTop : null);
          return new Scaffold(
            appBar: AppBar(
              title: Text('GridListDemo'),
            ),
            body: new RefreshIndicator(
                child: new CustomScrollView(
                  controller: _controller,
                  slivers: <Widget>[
                    //列表
                    new SliverGrid.count(
                      crossAxisCount: 2,
                      childAspectRatio: 1,
                      children: snapshot.data != null &&
                              snapshot.data.listData.length > 0
                          ? snapshot.data.listData.map((product) {
                              return _buildItemGrid(product);
                            }).toList()
                          : <Widget>[],
                    ),
                    new SliverToBoxAdapter(
                      child: Offstage(
                        offstage: snapshot.data == null?false:snapshot.data.loading,
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Container(
                            child: Center(
                              child: Text(
                                '正在加载中...',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    new SliverToBoxAdapter(
                      child: Offstage(
                        offstage: noMoreData,
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Container(
                            child: Center(
                              child: Text(
                                '没有更多数据了！',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                onRefresh: onRefresh
            ),
            floatingActionButton: snapshot.data != null && snapshot.data.goTop
                ? FloatingActionButton(
                    onPressed: () {
                      _controller.animateTo(0,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.ease);
                    },
                    child: Icon(Icons.arrow_upward),
                    clipBehavior: Clip.none,
                    tooltip: '长按显示这个',
                  )
                : null,
          );
        });
  }
}
