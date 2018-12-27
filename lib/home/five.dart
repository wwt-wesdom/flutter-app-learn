import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import './../store/store.dart' show AppState;
import '../store/reducer/userInfo_reducer.dart' show UserInfoAction;
import '../modal/user_info.dart';
class Five extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState,Map>(
      converter: (store){
        var userInfo = store.state.userInfo;
        var map = Map()..['changUserInfo'] = (userInfo){
          store.dispatch(UserInfoAction(userInfo));
        }..['text'] = userInfo.phone..['male'] = userInfo.male;
        print(map);
        return map;
      },
      builder: (context,map){
        void changUserInfo(userInfo){
          map['changUserInfo'](userInfo);
        }
        String male;
        if(map['male'] != null){
          male = map['male'];
        }else {
          male = '女';
        }
        return Scaffold(
          appBar: AppBar(
            title: Text('five'),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 200,
                child: RaisedButton(
                  onPressed: (){
                    changUserInfo(UserInfo(name: 'wwt',phone: '13888888888',age: '15'));
                  },
                  child: Center(
                    child: Text('切换电话号码',style: TextStyle(fontSize: 16),),
                  ),
                ),
              ),
              Center(
                child: Text(map['text']),
              ),
              Text(male)
            ],
          ),
        );
      },
    );
   /* return Scaffold(
      appBar: AppBar(
        title: Text('five'),
      ),
      body: Container(
        child: Center(
          child: Text('five'),
        ),
      ),
    );*/
  }
}
