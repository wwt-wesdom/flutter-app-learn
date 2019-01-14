import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import '../home/router_change_example.dart';
import '../home/five.dart';
import '../home/categories.dart';
import '../home/six.dart';
import '../home/sliver_header.dart';
import '../home/sliver_app_bar.dart';
import '../home/text_field.dart';
import '../home/dialogs_demo.dart';
import '../home/drawer_demo.dart';
import '../home/scroll_tabs_demo.dart';
import '../home/grid_list_demo.dart';
import '../home/shared_preferences_demo.dart';
import '../home/video_player_demo.dart';

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

Handler textFieldPageHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return TextFieldPage();
    }
);

Handler dialogsDemoHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return DialogsDemo();
    }
);

Handler drawerDemoHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return DrawerDemo();
    }
);

Handler scrollTabsDemoHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return ScrollTabsDemo();
    }
);

Handler gridListDemoHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return GridListDemo();
    }
);

Handler sharedPreferencesDemoHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return SharedPreferencesDemo();
    }
);

Handler videoPlayerDemoHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return VideoPlayerDemo();
    }
);

