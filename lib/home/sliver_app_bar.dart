import 'package:flutter/material.dart';
import '../modal/product_list.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
final List<ProductItem> _products = [
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
  ProductItem(
    name: 'Chocolate tree',
    asset: 'assets/images/food05.jpeg',
  ),
  ProductItem(
    name: 'Chocolate tree',
    asset: 'assets/images/food05.jpeg',
  ),
  ProductItem(
    name: 'Chocolate tree',
    asset: 'assets/images/food05.jpeg',
  ),
  ProductItem(
    name: 'Chocolate tree',
    asset: 'assets/images/food05.jpeg',
  ),
  ProductItem(
    name: 'Chocolate tree',
    asset: 'assets/images/food05.jpeg',
  ),
  ProductItem(
    name: 'Chocolate tree',
    asset: 'assets/images/food05.jpeg',
  ),
  ProductItem(
    name: 'Chocolate tree',
    asset: 'assets/images/food05.jpeg',
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
List imgListSwiper = [
  Image.asset('assets/images/food01.jpeg',fit: BoxFit.cover,),
  Image.asset('assets/images/food02.jpeg',fit: BoxFit.cover,),
  Image.asset('assets/images/food03.jpeg',fit: BoxFit.cover,)
];
class SliverAppbarPage extends StatefulWidget {
  @override
  _SliverAppbarPageState createState() => _SliverAppbarPageState();
}

class _SliverAppbarPageState extends State<SliverAppbarPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
//          控制tab是否消失
          pinned: true,
          title: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
//                Text('sliverAppBar'),
                Container(
                  height: 30.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    border: Border.all(
                      width: 1.0,
                      color: Colors.yellow
                    ),
                    color: Colors.blue,
                  ),
                  child: InkWell(
                    child: Row(
                     /* mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,*/
                      children: <Widget>[
                        new Padding(
                          padding: EdgeInsets.only(right: 8.0,left: 30.0),
                          child: Icon(
                            Icons.search,
                            color: Colors.white,
                            size: 20.0,
                          ),
                        ),
                        new Text('search category',style: TextStyle(fontSize: 14.0),),
                       /* new Expanded(
                            child: TextField(
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Search category',
                                  hintStyle: TextStyle(color: Colors.white)),
                              cursorColor: Colors.white,
                        ))*/
                      ],
                    ),
                    onTap: (){
                      print('asdflasd');
                    },
                  ),
                )
              ],
            ),
          ),
          backgroundColor: Theme.of(context).accentColor,
          expandedHeight: 200.0,
          flexibleSpace: new FlexibleSpaceBar(
//            background: Image.asset('assets/images/food01.jpeg',fit: BoxFit.cover,),
            background: Container(
              height: 200.0,
              child: Swiper(
                itemCount: 3,
                itemBuilder: (BuildContext context,int index){
                  return imgListSwiper[index];
                },
                pagination: new SwiperPagination(
                  builder: DotSwiperPaginationBuilder(
                        color: Colors.black54,
                        activeColor: Colors.white,
                )),
              ),
            ),
          ),
        ),
        SliverFixedExtentList(
            delegate: SliverChildListDelegate(
              _products.map((product){
                return _buildItemList(product);
              }).toList(),
            ),
            itemExtent: 100
        )
      ],
    );
  }
  Widget _buildItemList(ProductItem product) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: ClipRRect(
                  child: SizedBox(
                    width: 65.0,
                    height: 65.0,
                    child: Image.asset(
                      product.asset,
                      fit: BoxFit.cover,
                    ),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 15.0),
                  child: Text(
                    product.name,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
