import '../http/server.dart';

abstract class ApiConfig {
  static getHorseList(pragma) {
    return  HttpServerFactory.getHttp().get("/theme/list.json",pragma);
  }
  static getProductList(pragma) {
    return HttpServerFactory.getHttp().get("/coupon/categoryList.json",pragma);
  }
  static getBannerList(pragma) {
    return HttpServerFactory.getHttp().get("/user/getBanner.json",pragma);
  }

  static getChengQunNewsList(pragma) {
    return HttpServerFactory.getHttp().get("/coupon/chengqun-news.json",pragma);
  }


}