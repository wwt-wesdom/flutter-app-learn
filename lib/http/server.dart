import 'package:dio/dio.dart';
import 'dart:async' show Future;
class HttpServerFactory {
  static _HttpServer http;
  static _HttpServer getHttp() {
    if (http != null){
      return http;
    }else {
      http = _HttpServer();
      return http;
    }
  }
}

class ReformatData {
  final status;
  final statusCode;
  final success;
  final msg;
  final data;
  ReformatData({this.status,this.statusCode,this.success,this.msg,this.data});
}

class _HttpServer {
  final dio = new Dio();
  _HttpServer() {
    dio.options.baseUrl = "http://192.168.100.133:8099/api";
    dio.options.connectTimeout = 10000;
    dio.options.receiveTimeout = 10000;
    dio.interceptor.request.onSend = (Options options) {
      return options;
    };
    dio.interceptor.response.onSuccess = (Response response) {
      return ReformatData(
          status: response.data["status"],
          statusCode: response.data["statusCode"],
          success: response.data["success"],
          msg: response.data["msg"],
          data: response.data["data"],
      );
    };
    dio.interceptor.response.onError = (DioError err) {
      return err;
    };
  }

  Future get(String url, [data]){
    return dio.get(url,data: data);
  }

  Future post(String url, Map data){
    return dio.post(url,data: data);
  }
}