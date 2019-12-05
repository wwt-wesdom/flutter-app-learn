import 'package:flutter/material.dart';
import '../modal/product_list.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
//import 'package:common_utils/common_utils.dart';
import '../compnents/time_down.dart';

final List<ProductItem> _products = [
  ProductItem(
    name: 'Bueno Chocolate',
    asset: 'assets/images/food01.jpeg',
    time: 1547528347000
  ),
  ProductItem(
    name: 'Chocolate with berries',
    asset: 'assets/images/food02.jpeg',
    time: 1547531947000,
  ),
  ProductItem(
    name: 'Trumoo Candies',
    asset: 'assets/images/food03.jpeg',
    time: 1547535547000,
  ),
  ProductItem(
    name: 'Choco-coko',
    asset: 'assets/images/food04.jpeg',
    time: 1547535567000
  ),
  ProductItem(
    name: 'Chocolate tree',
    asset: 'assets/images/food05.jpeg',
    time: 1547535667000
  ),
  ProductItem(
    name: 'Chocolate',
    asset: 'assets/images/food06.jpeg',
    time: 1547535767000
  ),
  ProductItem(
    name: 'Bueno Chocolate',
    asset: 'assets/images/food01.jpeg',
    time: 1547535867000
  ),
  ProductItem(
    name: 'Choco-coko',
    asset: 'assets/images/food04.jpeg',
    time: 1547535967000
  ),
  ProductItem(
    name: 'Chocolate tree',
    asset: 'assets/images/food05.jpeg',
    time: 1547536067000
  ),
  ProductItem(
    name: 'Chocolate tree',
    asset: 'assets/images/food05.jpeg',
    time: 1547536167000
  ),
  ProductItem(
    name: 'Chocolate tree',
    asset: 'assets/images/food05.jpeg',
    time: 1547536267000
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
  ScrollController _controller = new ScrollController();
  bool showToTopBtn = false;
/*  String timeDownCount;
  timeDown(time){
    if (time - DateUtil.getNowDateMs() <= 0){
      return '倒计时结束';
    }
    TimerUtil timerCountDown = new TimerUtil(mInterval: 1000,mTotalTime: (time - DateUtil.getNowDateMs()));
    timerCountDown.cancel();
    String timeString;
    timerCountDown.setOnTimerTickCallback((int value){
      double tick = (value/1000);
      int leftTime = tick.toInt();
      double dayDouble = (leftTime/(24*60*60));
      String day = dayDouble.toInt().toString();
      double hourDouble = (leftTime/(60*60)%24);
      String hour = hourDouble.toInt().toString();
      double minDouble = (leftTime / 60 % 60);
      String min = minDouble.toInt().toString();
      String s = (leftTime % 60).toString();
      setState(() {
        timeDownCount = tick.toInt().toString();
        timeDownCount = "$day天$hour小时$min分$s秒";
      });
//      LogUtil.e("countDown:" + tick.toInt().toString());
      timeString = "$day天$hour小时$min分$s秒";
    });
    timerCountDown.startCountDown();
    return timeString;
  }*/
  @override
  void initState(){
    super.initState();
    _controller.addListener(() {
      if (_controller.offset < 200 && showToTopBtn) {
        setState(() {
          showToTopBtn = false;
        });
      } else if (_controller.offset >= 200 && showToTopBtn == false) {
        setState(() {
          showToTopBtn = true;
        });
      }
    });
    const b = 1;
    const List a = [b,2,3];

  }
  @override
  void dispose() {
    //为了避免内存泄露，需要调用_controller.dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _controller,
        slivers: <Widget>[
          new SliverAppBar(
//          控制tab是否消失
            pinned: true,
            title: new Container(
              color: Colors.white10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  /* new AnimatedContainer(
                  height: showToTopBtn?0.0:20.0,
                  duration: Duration(milliseconds: 300),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('club factory',style: TextStyle(fontSize: 16.0),),
                    ],
                  ),
                ),*/
                  new Container(
                    height: 25.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      border: Border.all(
                          width: 1.0,
                          color: Colors.yellow
                      ),
                      color: Colors.grey.shade50,
                    ),
                    child: new InkWell(
                      child: Row(
                        /* mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,*/
                        children: <Widget>[
                          new Padding(
                            padding: EdgeInsets.only(right: 8.0,left: 30.0),
                            child: Icon(
                              Icons.search,
                              color: Colors.grey,
                              size: 20.0,
                            ),
                          ),
                          new Text('search category',style: TextStyle(fontSize: 14.0,color: Colors.grey),),
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
                  autoplay: true,
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
          new SliverFixedExtentList(
            delegate: SliverChildListDelegate(
              _products.map((product){
                return _buildItemList(product);
              }).toList(),
            ),
            itemExtent: 100,

          )
        ],
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
                  child: Column(
                    children: <Widget>[
                      Text(
                        product.name,
                        overflow: TextOverflow.ellipsis,
                      ),
                      TimeDown(product.time)
                    ],
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
