import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:wwt/pages/router_change_example.dart';
import 'package:wwt/pages/five.dart';
import 'package:wwt/pages/categories.dart';
import 'package:wwt/pages/six.dart';
import 'package:wwt/pages/sliver_header.dart';
import 'package:wwt/pages/sliver_app_bar.dart';
import 'package:wwt/pages/text_field.dart';
import 'package:wwt/pages/dialogs_demo.dart';
import 'package:wwt/pages/drawer_demo.dart';
import 'package:wwt/pages/scroll_tabs_demo.dart';
import 'package:wwt/pages/grid_list_demo.dart';
import 'package:wwt/pages/shared_preferences_demo.dart';
import 'package:wwt/pages/video_player_demo.dart';
import 'package:wwt/pages/animation_demo.dart';
import 'package:wwt/pages/count_bloc_demo.dart';
import 'package:wwt/pages/count_increment.dart';
import 'package:wwt/pages/horse_home.dart';
import 'package:wwt/pages/home_screen.dart';
import 'package:wwt/widgets/slider.dart';

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

Handler animationDemoHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return AnimationDemo();
    }
);

Handler countBlocDemoHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return CountBlocDemo();
    }
);

Handler countIncrementHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return CountIncrement();
    }
);

Handler horseHomeHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return HorseHome();
    }
);

Handler homeScreenHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return HomeScreen();
    }
);

Handler itemHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return Item();
    }
);

