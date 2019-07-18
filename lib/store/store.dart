import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import '../modal/user_info.dart';
import 'reducer/theme_reducer.dart' show ThemeReducer;
import 'reducer/userInfo_reducer.dart' show UserInfoReducer;
class AppState {
  Map map;
  UserInfo userInfo;
  AppState({this.map,this.userInfo});
}

AppState appReducer(AppState state,action){
  return AppState(
    map: ThemeReducer(state.map,action),
    userInfo: UserInfoReducer(state.userInfo,action)
  );
}

final store = Store<AppState>(
  appReducer,
  initialState: AppState(
    map: {
      'color': Colors.red,
      'international':'cn'
    },
    userInfo: UserInfo(name:'lilei',male:'男',age:'15',phone:'15737962939')
  )
);


