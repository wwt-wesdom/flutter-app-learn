import 'package:flutter/material.dart';
import 'package:flutter_app/blocs/bloc_provider.dart';
import 'package:flutter_app/blocs/app_init/bloc_init_page.dart';
//import 'package:flutter_jpush/flutter_jpush.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isConnected = false;
  String registrationId;
  List notificationList = [];

  @override
  void initState() {
    super.initState();
    /*_startupJpush();
    FlutterJPush.addConnectionChangeListener((bool connected) {
      setState(() {
        /// 是否连接，连接了才可以推送
        print("连接状态改变:$connected");
        this.isConnected = connected;
        if (connected) {
          FlutterJPush.getRegistrationID().then((String regId) {
            print("主动获取设备号:$regId");
            setState(() {
              this.registrationId = regId;
            });
          });
        }
      });
    });

    FlutterJPush.addnetworkDidLoginListener((String registrationId) {
      setState(() {
        /// 用于推送
        print("收到设备号:$registrationId");
        this.registrationId = registrationId;
      });
    });

    FlutterJPush.addReceiveNotificationListener(
            (JPushNotification notification) {
          setState(() {
            /// 收到推送
            print("收到推送提醒: $notification");
            notificationList.add(notification);
          });
        });

    FlutterJPush.addReceiveOpenNotificationListener(
            (JPushNotification notification) {
          setState(() {
            print("打开了推送提醒: $notification");

            /// 打开了推送提醒
            notificationList.add(notification);
          });
        });

    FlutterJPush.addReceiveCustomMsgListener((JPushMessage msg) {
      setState(() {
        print("收到推送消息提醒: $msg");

        /// 打开了推送提醒
        notificationList.add(msg);
      });
    });*/
  }
 /* void _startupJpush() async {
    print("初始化jpush");
    await FlutterJPush.startup();
    print("初始化jpush成功");
  }*/
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



