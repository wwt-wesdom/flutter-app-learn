import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import '../home/router_change_example.dart';
import '../home/five.dart';
import '../home/categories.dart';
import '../home/six.dart';
import '../home/sliver_header.dart';
import '../home/sliver_app_bar.dart';

Handler articleDetailHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      String articleId = params['id']?.first;
      String title = params['title']?.first;
//      print('index>,articleDetail id is $articleId');
      return ArticleDetail(articleId, title);
  }
);

Handler fiveHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return Five();
    }
);

Handler categoriesHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return Categories();
    }
);

Handler sixHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return Six();
    }
);

Handler sliverHeaderHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return Sliverheader();
    }
);

Handler sliverAppbarPageHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return SliverAppbarPage();
    }
);
