import './router_handler.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

class Routes {
  static String root = '/';
  static String articleDetail = "/detail";
  static String five = "/five";
  static String categories = "/categories";
  static String six = "/six";
  static String sliverHeader = "/sliver-header";
  static String sliverAppBar = "/sliver-app-bar";

  static void configureRoutes(Router router) {
    router.notFoundHandler = new Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
          print("ROUTE WAS NOT FOUND !!!");
        });

    router.define(articleDetail, handler: articleDetailHandler);
    router.define(five, handler: fiveHandler);
    router.define(categories, handler: categoriesHandler);
    router.define(six, handler: sixHandler);
    router.define(sliverHeader, handler: sliverHeaderHandler);
    router.define(sliverAppBar, handler: sliverAppbarPageHandler);
  }
}