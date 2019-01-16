import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import '../api/index.dart';

class HorseHome extends StatefulWidget {
  @override
  _HorseHomeState createState() => _HorseHomeState();
}
//轮播图 Model
class SwiperListItem {
  final String imgUrl;
  final int id;
  final String adUrl;
  SwiperListItem({this.imgUrl,this.id,this.adUrl});
}
//今日热销 Model
class TodayHotSellItem {
  final String img;
  final String title;
  final String earnMoney;
  final String price;
  TodayHotSellItem({this.img,this.title,this.earnMoney,this.price});
}
//轮播图Widget
Widget _swiperListItem(SwiperListItem item){
  return InkWell(
    child: Image.network(item.imgUrl,fit: BoxFit.cover,),
    onTap: (){
      print(item.adUrl);
    },
  );
}
//今日热销Widget
Widget _todayHotSellItem(item){
  return Container(
    width: 220,
    margin: EdgeInsets.all(10.0),
    padding: EdgeInsets.all(10.0),
    decoration: BoxDecoration(
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.grey,
          offset: Offset(3.0, 3.0),
          blurRadius: 4.0
        )
      ]
    ),
    child: InkWell(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            child: SizedBox(
              width: 200.0,
              height: 200.0,
              child: FadeInImage.assetNetwork(
                placeholder: 'assets/images/glnz.jpg',
                image: item.img,
                fit: BoxFit.fill,
              ),
            ),
            borderRadius: BorderRadius.circular(5.0),
          ),
          Container(height: 3.0,),
          Text(item.title,overflow: TextOverflow.ellipsis,),
          Padding(
            padding: EdgeInsets.only(top: 3.0,bottom: 3.0),
            child: Offstage(
              offstage: item.earnMoney == "0"?true:false,
              child: Row(
                children: <Widget>[
                  Container(
                    child: Center(
                      child: Text("券10",style: TextStyle(color: Colors.white)),
                    ),
                    width: 45,
                    height: 25,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage("https://taoke-prod.oss-cn-hangzhou.aliyuncs.com/home/juan.png"),
                            fit: BoxFit.fill
                        )
                    ),
                  ),
                  Container(width: 5.0,),
                  Container(
                    padding: EdgeInsets.only(left: 2.0,right: 2.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2.0),
                        border: Border.all(color: Colors.blue,width: 1.0),
                        color: Colors.yellowAccent
                    ),
                    child: Text("预估佣金${item.earnMoney}",style: TextStyle(color: Colors.red)),
                  )
                ],
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text('到手价：￥',style: TextStyle(color: Colors.red),),
              Container(width: 5.0,),
              Text(item.price,style: TextStyle(fontSize: 20,color: Colors.red),)
            ],
          )
        ],
      ),
      onTap: (){
        print('to goods details page');
      },
    ),
  );
}


class _HorseHomeState extends State<HorseHome> {
  ScrollController _controller = new ScrollController();
  bool showToTop = true;
  List imgListSwiperTwo = [
    Image.asset('assets/images/food01.jpeg',fit: BoxFit.cover,),
    Image.asset('assets/images/food02.jpeg',fit: BoxFit.cover,),
    Image.asset('assets/images/food03.jpeg',fit: BoxFit.cover,)
  ];
  List<SwiperListItem> imgListSwiper = [];
  List<TodayHotSellItem> todayHotSell = [];
  List<TodayHotSellItem> recommendList = [];

  void initState(){
    super.initState();
    _controller.addListener((){
      if(_controller.offset >= 500){
        if(showToTop){
          setState(() {
            showToTop = false;
          });
          print(showToTop);
        }
      }else {
        if(!showToTop){
          setState(() {
            showToTop = true;
          });
        }
      }
    });
    getBanner();
    getChengQunNewsList();
    getRecommendList();
  }
  void getBanner() {
    ApiConfig.getBannerList({
      "adType": "h5_home_page"
    }).then((res){
      print(res.data.data);
      List data = res.data.data;
      List<SwiperListItem> imgList = [];
      data.forEach((item){
        imgList.add(SwiperListItem(imgUrl: item["adImg"],id: item["id"],adUrl: item["adUrl"]));
      });
      setState(() {
        imgListSwiper = imgList;
      });
    });
  }
// 今日热销数据获取
  void getChengQunNewsList() {
    ApiConfig.getChengQunNewsList({
      "topcate":"",
      "subcate":"",
      "page": 1,
      "pageSize": 10,
      "ptype":"",
      "sort": "total_sales_des",
      "favoritesId": 18806351
    }).then( (res){
      List<TodayHotSellItem> todayHotSellList = [];
      print(res.data.data["data"]["data"]);
      List data = res.data.data["data"]["data"];
      data.forEach((item){
        todayHotSellList.add(TodayHotSellItem(img: item["picUrl"],title: item["title"],earnMoney:(item["couponRemainCount"]/100).toString(),price: item["zkFinalPrice"] ));
      });
      setState(() {
        todayHotSell = todayHotSellList;
      });
    });
  }
// 为你推荐数据获取
  void getRecommendList() {
    ApiConfig.getChengQunNewsList({
      "topcate":"",
      "subcate":"",
      "page": 1,
      "pageSize": 10,
      "ptype":"",
      "sort": "total_sales_des",
      "favoritesId": 18901731
    }).then( (res){
      print(res.data.data["data"]["data"]);
      List<TodayHotSellItem> recommendDataList = [];
      List data = res.data.data["data"]["data"];
      data.forEach((item){
        recommendDataList.add(TodayHotSellItem(img: item["picUrl"],title: item["title"],earnMoney:(item["couponRemainCount"] != null?item["couponRemainCount"] /100 : 0).toString(),price: item["zkFinalPrice"] ));
      });
      setState(() {
        recommendList = recommendDataList;
      });
      print(recommendDataList.length);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("天马折扣-首页"),
      ),
      body: CustomScrollView(
        controller: _controller,
        slivers: <Widget>[
          new SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
              color: Colors.grey.shade100,
              child: Container(
                padding: EdgeInsets.all(5.0),
                color: Colors.white,
                child: InkWell(
                  onTap: (){
                    print("search");
                  },
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.search),
                      Container(width: 3.0,),
                      Text('请输入搜索关键词')
                    ],
                  ),
                ),
              ),
            ),
          ),
          new SliverToBoxAdapter(
            child: Container(
              height: 200,
              child: Swiper(
                autoplay: true,
                itemCount: 3,
                itemBuilder: (BuildContext context,int index){
                  if(imgListSwiper.length == 0){
                    return imgListSwiperTwo[index];
                  }else{
                    return _swiperListItem(imgListSwiper[index]);
                  }
                },
                pagination: new SwiperPagination(
                  builder: DotSwiperPaginationBuilder(
                    color: Colors.black54,
                    activeColor: Colors.white,
                )),
//                control: new SwiperControl(),
              ),
            )
          ),
          new SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.only(top: 10.0,bottom: 10.0),
              height: 130,
              child: Flex(
                direction: Axis.horizontal,
                children: <Widget>[
                  Expanded(
                    child: Image.network("https://taoke-prod.oss-cn-hangzhou.aliyuncs.com/home/9.9.png"),
                    flex: 1,
                  ),
                  Expanded(
                    child: Image.network("https://taoke-prod.oss-cn-hangzhou.aliyuncs.com/home/hot.png"),
                    flex: 1,
                  ),
                ],
              ),
            ),
          ),
          new SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.all(5.0),
              child: InkWell(
                child: Image.network("https://taoke-prod.oss-cn-hangzhou.aliyuncs.com/home/new-course.png" ,fit: BoxFit.cover,),
                onTap: () {
                  print("how to earn money");
                },
              ),
            ),
          ),
          new SliverToBoxAdapter(
            child: Container(
              height: 50,
              padding: EdgeInsets.only(left: 10.0,bottom: 10.0),
              child: Flex(
                direction: Axis.horizontal,
                children: <Widget>[
                  Expanded(
                    flex: 8,
                    child: Text("今日热销",style: TextStyle(fontSize: 18),)
                  ),
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      child: Icon(Icons.arrow_forward_ios,color: Colors.grey,),
                      onTap: (){
                        print("今日热销");
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          new SliverToBoxAdapter(
            child: Container(
              height: 320,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context,int index){
                  if(index == todayHotSell.length){
                    return Container(
                      padding: EdgeInsets.only(left: 10.0,top: 10.0,right: 10.0,bottom: 90.0),
                      child: Container(
                          child: Text("查看更多"),
                          width: 200,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.grey
                          )
                      ),
                    );
                  }
                  return _todayHotSellItem(todayHotSell[index]);
                },
                itemCount: todayHotSell.length + 1,
              ),
            ),
          ),
          new SliverToBoxAdapter(
            child: Row(
              children: <Widget>[
                Container(
                  child: Text("为你推荐",style: TextStyle(fontSize: 20.0),),
                  padding: EdgeInsets.all(10.0),
                )
              ],
            ),
          ),
          new SliverGrid.count(
            crossAxisCount: 2,
            childAspectRatio: 0.64,
            children: recommendList.map((product){
              return _todayHotSellItem(product);
            }).toList(),
          )
        ],
      ),
      floatingActionButton: showToTop ? null : FloatingActionButton(
        onPressed: (){
          _controller.animateTo(0, duration: Duration(milliseconds: 500), curve: Curves.ease);
        },
        child: Icon(Icons.arrow_upward),
        clipBehavior: Clip.none,
        tooltip: '长按显示这个',
      ),
    );
  }
}
