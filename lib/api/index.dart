import '../http/server.dart';

abstract class ApiConfig {
  static getHorseList(pragma) {
    return  HttpServerFactory.getHttp().get("/theme/list.json",pragma);
  }
  static getProductList(pragma) {
    return HttpServerFactory.getHttp().get("/coupon/every-special-offer.json",pragma);
  }

}