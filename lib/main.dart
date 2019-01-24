import 'package:flutter/material.dart';
import "./home/home_screen.dart";
import 'package:flutter_redux/flutter_redux.dart';
import 'store/store.dart';
import 'package:flutter_app/blocs/bloc_provider.dart';
import 'package:flutter_app/blocs/app_init/bloc_init_page.dart';

import "./constants.dart" show AppColors;
void main() => runApp(MyApp());
/*class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreProvider(
        store: store,
        child: App()
    );
  }
}

class App extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return  StoreConnector<AppState,Color>(
          builder: (context,color){
            return  MaterialApp(
              title: '微信',
              theme: ThemeData(
                primarySwatch: Colors.blue,
                cardColor: Colors.white,
              ),
              home: HomeScreen(),
            );
          },
          converter: (store){
            return store.state.map['color'];
          }
      );
    }
  }*/

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      child: MaterialApp(
        title: '微信',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          cardColor: Colors.white,
        ),
        home: InitializationPage(),
      ),
    );
  }
}


