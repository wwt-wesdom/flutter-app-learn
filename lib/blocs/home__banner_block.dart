import 'package:rxdart/rxdart.dart';
import 'dart:async';
import 'dart:core';
import 'package:flutter_app/api/index.dart';

class SwiperListItem {
  final String imgUrl;
  final int id;
  final String adUrl;
  SwiperListItem({this.imgUrl,this.id,this.adUrl});
}

class HomeBanner {
  BehaviorSubject<List<SwiperListItem>> _homeBannerList = BehaviorSubject<List<SwiperListItem>>();
  Sink<List<SwiperListItem>> get _homeBannerSink => _homeBannerList.sink;
  Stream<List<SwiperListItem>> get homeBannerStream => _homeBannerList.stream;

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

  void dispose(){
    _homeBannerList.close();
  }
}