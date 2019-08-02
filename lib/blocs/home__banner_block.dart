import 'package:rxdart/rxdart.dart';
import 'dart:async';
import 'dart:core';
import 'package:wwt/api/index.dart';
import 'package:dio/dio.dart';

class SwiperListItem {
  final String imgUrl;
  final int id;
  final String adUrl;
  SwiperListItem({this.imgUrl,this.id,this.adUrl});
}

class TodayHotSellItem {
  final String img;
  final String title;
  final String earnMoney;
  final String price;
  TodayHotSellItem({this.img,this.title,this.earnMoney,this.price});
}

class HomeBanner {
  BehaviorSubject<List<SwiperListItem>> _homeBannerList = BehaviorSubject<List<SwiperListItem>>();
  Sink<List<SwiperListItem>> get _homeBannerSink => _homeBannerList.sink;
  Stream<List<SwiperListItem>> get homeBannerStream => _homeBannerList.stream;

  BehaviorSubject<List<TodayHotSellItem>> _recommendList = BehaviorSubject<List<TodayHotSellItem>>();
  Sink<List<TodayHotSellItem>> get _recommendListSink => _recommendList.sink;
  Stream<List<TodayHotSellItem>> get recommendListStream => _recommendList.stream;

  Future getBanner() {
   return ApiConfig.getBannerList({
      "adType": "h5_home_page"
    }).then((res){
      List data = res.data.data;
      List<SwiperListItem> imgList = [];
      data.forEach((item){
        imgList.add(SwiperListItem(imgUrl: item["adImg"],id: item["id"],adUrl: item["adUrl"]));
      });
      _homeBannerSink.add(imgList);
    });
  }

  void getRecommendList() async{
    try {
      Response response;
      response = await ApiConfig.getAllSysConfig();
      print(response);
//      List<TodayHotSellItem> recommendDataList = [];
     /* data.forEach((item){
        recommendDataList.add(TodayHotSellItem(img: item["picUrl"],title: item["title"],earnMoney:(item["couponRemainCount"] != null?item["couponRemainCount"] /100 : 0).toString(),price: item["zkFinalPrice"].toString() ));
      });*/
//      _recommendListSink.add(recommendDataList);
    } catch (e){
      print(e);
    }
  }

  void dispose(){
    _homeBannerList.close();
    _recommendList.close();
  }
}