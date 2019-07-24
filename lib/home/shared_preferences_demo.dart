import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async' show Future;

class SharedPreferencesDemo extends StatefulWidget {
  @override
  _SharedPreferencesDemoState createState() => _SharedPreferencesDemoState();
}

class _SharedPreferencesDemoState extends State<SharedPreferencesDemo> {
  TextEditingController _unameController = new TextEditingController();
  String initText = '这是取得值';
  save() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("myUserName", _unameController.text.toString());
  }

  Future<String> getUserName() async {
    var userName;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userName = prefs.getString("myUserName");
    return userName;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SharedPreferencesDemo'),
      ),
      body: Center(
        child: new Builder(builder: (BuildContext context){
          return  new Column(
            children: <Widget>[
              new TextField(
                decoration: InputDecoration(
                  labelText: "用户名",
                  hintText: "请输入用户名",
                  prefixIcon: Icon(Icons.person),
                  hintStyle: TextStyle(fontSize: 14,color: Colors.green)
                ),
                controller: _unameController,
              ),
              new RaisedButton(
                onPressed: (){
                  save();
                },
                color: Colors.blue,
                child: Text('存储'),
              ),
              new RaisedButton(
                onPressed: (){
                  Future<String> userName = getUserName();
                  userName.then((String userName) {
                    Scaffold.of(context).showSnackBar(
                      SnackBar(
                        content: Text("数据获取成功：$userName"),
                      )
                    );
                    setState(() {
                      initText = userName;
                    });
                  }
                  );
                },
                color: Colors.yellow,
                child: Text('获取'),
              ),
              new Center(
                child: Text(initText),
              )
            ],
          );
        }),
      ),
    );
  }
}
