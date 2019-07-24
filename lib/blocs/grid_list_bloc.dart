import 'package:rxdart/rxdart.dart';
import 'package:wwt_flutter_app/api/index.dart';
import 'dart:core';
import 'dart:async' show Stream;

class ProductItem {
  final String name;
  final String asset;
  ProductItem({this.name,this.asset});
}

class ResMap {
  final List<ProductItem> listData;
  final noMoreData;
  final loading;
  final goTop;
  ResMap({this.listData,this.noMoreData,this.loading,this.goTop});
}

class GridList {
  BehaviorSubject<ResMap> _gridList = BehaviorSubject<ResMap>();
  Sink<ResMap> get _gridListSink => _gridList.sink;
  Stream<ResMap> get gridListStream => _gridList.stream;

  BehaviorSubject<bool> _returnToTop = BehaviorSubject<bool>();
//  Sink<bool> get _returnToTopSink => _returnToTop.sink;
//  Stream<bool> get _returnToTopStream => _returnToTop.stream;

  List<ProductItem> gridList = [];
  Map resMap = {};
  bool noMoreData = false;
  bool loading = false;
  bool goTop = false;
  Future getGridList(pageIndex){
    loading = true;
    return ApiConfig.getProductList({
      "q":"",
      "page": pageIndex,
      "pageSize": 10,
      "cid":1001,
      "has_coupon":true,
      "start_price":"",
      "end_price":"",
      "need_free_shipment":"",
      "sort":"total_sales_des",
    }).then((res){
      loading = false;
      if(res.data.data !=null && res.data.data['data'].length > 0){
        List listData = res.data.data['data'];
        listData.forEach((item){
          gridList.add(ProductItem(
              name: item['title'],
              asset: item['picUrl']
          ));
        });
      }else {
        noMoreData = true;
      }
      _gridListSink.add(ResMap(listData: gridList,loading: loading,noMoreData: noMoreData,goTop: goTop));
    });
  }

  void changeData(value){
    goTop = value;
    _gridListSink.add(ResMap(listData: gridList,loading: loading,noMoreData: noMoreData,goTop: goTop));
  }
  void dispose() {
    _gridList.close();
    _returnToTop.close();
  }
}