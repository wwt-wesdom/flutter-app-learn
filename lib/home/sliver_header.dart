import 'package:flutter/material.dart';
import '../modal/product_list.dart';
import 'dart:ui';
import 'dart:math' as math;
final List<String> titleAssets = [
  'assets/images/food01.jpeg',
  'assets/images/food02.jpeg',
  'assets/images/food03.jpeg',
];
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
];
final List<ProductItem> _products2 = []..addAll(_products)..addAll(_products);
class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => math.max(maxHeight, minHeight);

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

class Sliverheader extends StatefulWidget {
  @override
  _SliverheaderState createState() => _SliverheaderState();
}

class _SliverheaderState extends State<Sliverheader> {
  bool floating = false;
  bool pinned = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('sliverHeader'),
        actions: <Widget>[
          _buildAction(),
        ],
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          _buildHeader(0),
          SliverGrid.count(
            crossAxisCount: 3,
            children: _products.map((product){
              return  _buildItemGrid(product);
            }).toList(),
          ),
          _buildHeader(1),
          SliverFixedExtentList(
            delegate: SliverChildListDelegate(
              products.map((product){
                return _buildItemList(product);
              }).toList(),
            ),
            itemExtent: 100.0
          ),
          _buildHeader(2),
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context,int index){
                return _buildItemGrid2(_products2[index]);
              },
              childCount: _products2.length,
            ),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200.0,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 3.0,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildAction() {
    return PopupMenuButton(
      itemBuilder: (context) => [
        const PopupMenuItem<int>(
          value: 0,
          child: Text('reset'),
        ),
        const PopupMenuItem<int>(
          value: 1,
          child: Text('floating'),
        ),
        const PopupMenuItem<int>(
          value: 2,
          child: Text('pinned'),
        ),
      ],
      onSelected: (value) {
        switch (value) {
          case 0:
            setState(() {
              floating = false;
              pinned = false;
            });
            break;
          case 1:
            setState(() {
              floating = true;
              pinned = false;
            });
            break;
          case 2:
            setState(() {
              floating = false;
              pinned = true;
            });
            break;
        }
      },
    );
  }

  Widget _buildItemGrid(ProductItem product) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ClipRRect(
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
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(top: 6.0),
                  child: Text(
                    product.name,
                    textAlign: TextAlign.center,
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
  
  Widget _buildItemGrid2(ProductItem product) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: ClipRRect(
                  child: SizedBox(
                    width: 20.0,
                    height: 20.0,
                    child: Image.asset(
                      product.asset,
                      fit: BoxFit.cover,
                    ),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 6.0),
                  child: Text(
                    product.name,
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              )
            ],
          ),
        ),
      ),
    );
  }

  SliverPersistentHeader _buildHeader(int index){
    String asset = titleAssets[index];
    return SliverPersistentHeader(
      pinned: pinned,
      floating: floating,
      delegate: _SliverAppBarDelegate(
        minHeight: 60.0,
        maxHeight: 180.0,
        child: Container(
          decoration: BoxDecoration(
              backgroundBlendMode: BlendMode.plus,
              image: DecorationImage(
                image: AssetImage(asset),
                fit: BoxFit.fill,
              ),
              color: Colors.white),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
            child: Container(
              child: Center(
                child: Text(
                  'This is header ${index + 1}',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xE5FFFFFF),
                  ),
                ),
              ),
            ),
          ),
        ),
      )
    );
  }
}
