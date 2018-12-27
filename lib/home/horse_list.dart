import 'package:flutter/material.dart';
import '../modal/conversation.dart' show SkyHorseList;
import '../routers/application.dart';
import 'dart:core';
import 'package:dio/dio.dart';

class HorseList extends StatefulWidget {
  @override
  _HorseListState createState() => _HorseListState();
}

class _HorseListItem extends StatelessWidget {
  _HorseListItem(SkyHorseList item) {
    this.skyHorseList = item;
  }
  SkyHorseList skyHorseList;
  @override
  Widget build(BuildContext context) {
    /*   Widget imgBox = Stack(
      overflow: Overflow.clip,
      children: <Widget>[
        Image.asset('assets/images/example.jpg',width: 200.0,height: 200.0,fit: BoxFit.cover,),
      ],
    );*/
    Widget InkWellContainer = Container(
      width: 50,
      height: 50,
      color: Colors.pink,
      child: InkWell(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('点我啊',style: TextStyle(color: Colors.white),),
          ],
        ),
        onTap: (){
          Application.router.navigateTo(context, "/detail?id=${Uri.encodeComponent('123456')}&title=${Uri.encodeComponent('12311212')}");
        },
      ),
    );
    Widget imgBox =  Container(
      margin: EdgeInsets.only(
          top: 10.0
      ),
      width: 200.0,
      height: 200.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.red,
          image: DecorationImage(
              image: NetworkImage(skyHorseList.imgUrl),
              fit: BoxFit.cover
          )
      ),
    );
    Widget textContainer = Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.0),
            bottomRight: Radius.circular(10.0),
          )
      ),
      child: Text(skyHorseList.price,style: TextStyle(color: Colors.white),),
    );
    Widget imgContainer = Container(
      /*  width: 200.0,
      height: 200.0,
      color: Colors.red,*/
      child: Stack(
        children: <Widget>[
          imgBox,
          Positioned(
            child: textContainer,
            bottom: 5.0,
            right: 5.0,
          )
        ],
      ),
    );
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          border: Border(
              top: BorderSide(
                  width: 5.0,
                  color: Colors.grey
              )
          )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Image.network('https://taoke-prod.oss-cn-hangzhou.aliyuncs.com/common/mgr/sm-logo.png?v=1.1',width: 40.0,height: 40.0,),
              Container(width: 10.0,),
              Text('橙子君',style: TextStyle(fontSize: 16.0),),
            ],
          ),
          Container(height: 10.0,),
          Text(skyHorseList.title,style: TextStyle(fontSize: 14.0),maxLines: 1,softWrap: false,),
          imgContainer,
          Container(height: 10.0,),
          Text(skyHorseList.time,style: TextStyle(fontSize: 12.0),),
          InkWellContainer
        ],
      ),
    );
  }
  
}
class _HorseListState extends State<HorseList> {
  List<dynamic> listData = [];
  List<SkyHorseList> mokSkyHorseList = [];
  void initState(){
    super.initState();
    dioText();
  }
  void dioText() async{
    Dio dio = Dio();
    Response response = await dio.get("http://192.168.100.133:8099/api/theme/list.json?pageIndex=1&pageSize=10&sort=&orderBy=");
    listData = response.data['data']['content'];
    listData.forEach((item){
      mokSkyHorseList.add(SkyHorseList(
          title: item['content'],
          imgUrl: item['items'][0]['itemPicUrl'],
          price: '9.9',
          time: item['createTime']
      ));
    });
    setState(() {
      mokSkyHorseList = mokSkyHorseList;
    });
  }
  var a = 15;
  Future<void> _onRefresh() async {
    print('刷新');
  }
  @override
  Widget build(BuildContext context) {
    /*return Column(
      children: <Widget>[
        Container(
          child: Text('title'),
        ),
        Container(
          height: 600,
          child: RefreshIndicator(
            onRefresh: _onRefresh,
            child: ListView.builder(
              itemBuilder: (BuildContext context,int index){
                return _HorseListItem(skyHorseList:mokSkyHorseList[index]);},
              itemCount: mokSkyHorseList.length,
            ),
          ),
        )
      ],
    );*/
    return CustomScrollView(
     slivers: <Widget>[
       SliverToBoxAdapter(
         child: Container(
           decoration: BoxDecoration(
             color: Colors.red
           ),
           height: 400,
           child: ListView.builder(
             scrollDirection: Axis.horizontal,
             itemBuilder: (BuildContext context,int index){
               return _HorseListItem(mokSkyHorseList[index]);},
             itemCount: mokSkyHorseList.length,
           ),
         ),
       ),
       SliverList(
         delegate: SliverChildBuilderDelegate(
           (BuildContext context, int index) {
             return _HorseListItem(mokSkyHorseList[index]);
           },
           childCount: mokSkyHorseList.length,
         ),
       )
     ],
    );
  }
}
