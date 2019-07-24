import 'package:flutter/material.dart';
import '../routers/application.dart';
import '../modal/toast.dart' show Toast;
import 'package:flutter/services.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'dart:async';
import 'package:wwt_flutter_app/widgets/slider.dart';

class Five extends StatefulWidget {
  @override
  _FiveState createState() => _FiveState();
}

class _FiveState extends State<Five> with TickerProviderStateMixin{
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  static copyToClipboard(String text,context){
    Clipboard.setData(new ClipboardData(text: text));
    Toast.toast(context: context,msg: '复制成功');
  }
/// facebook login
  ///
  static final FacebookLogin facebookSignIn = new FacebookLogin();
  Future<Null> _login() async {
    final FacebookLoginResult result = await facebookSignIn.logInWithReadPermissions(['email', 'public_profile']);
    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final FacebookAccessToken accessToken = result.accessToken;
        break;
      case FacebookLoginStatus.cancelledByUser:
        break;
      case FacebookLoginStatus.error:
        break;
    }
  }
/*
  Future<Null> _logOut() async {
    await facebookSignIn.logOut();
    print('Logged out.');
  }*/


  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    List<Widget> bottomList = [];
    for (var i = 0; i < 10; i++) {
      bottomList.add(
          new InkWell(
            child:  new ListTile(
              leading: new Icon(Icons.photo_camera),
              title: new Text("Camera$i"),
            ),
            onTap: (){
              Navigator.pop(context);
            },
          )
      );
    }
    return new Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('five'),
      ),
      body: new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new InkWell(
            onTap: (){
            },
            child: Semantics(
              button: true,
              label: 'open drawer',
              excludeSemantics: true,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  new Container(
                    width: 110.0,
                    height: 110.0,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.yellow,
                        image: DecorationImage(
                            image: AssetImage('assets/images/glnz.jpg'),
                            fit: BoxFit.fill
                        )
                    ),
                  ),
                  new Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text('Tap here to open the drawer',style: Theme.of(context).textTheme.subhead),
                  )
                ],
              ),
            ),
          ),
          new FloatingActionButton(
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context){
                    return new ListView.builder(
                      itemBuilder: (BuildContext context ,int index){
                        return bottomList[index];
                      },
                      itemCount: bottomList.length,
                    );
                  },
              );
            },
            foregroundColor: Colors.white,
            child: Text('点我'),
          ),
          new Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Wrap(
              direction: Axis.horizontal,
              alignment: WrapAlignment.start,
              runAlignment: WrapAlignment.start,
              spacing: 5.0,
              runSpacing: 0.0,
              children: <Widget>[
                new RaisedButton(
                  child: Text('TextField'),
                  onPressed: (){
                    Application.router.navigateTo(context, "/text-field");
                  },
                ),
                new RaisedButton(
                  child: Text('Dialogs',style: TextStyle(color: Colors.red)),
                  onPressed: (){
                    Application.router.navigateTo(context, "/dialogs-demo");
                  },
                ),
                new RaisedButton(
                  child: Text('Drawer',style: TextStyle(color: Colors.blue)),
                  onPressed: (){
                    Application.router.navigateTo(context, "/drawer-demo");
                  },
                ),
                new RaisedButton(
                  child: Text('toast',style: TextStyle(color: Colors.blue)),
                  onPressed: (){
                    Toast.toast(context:context,msg:'123456789',second: 500);
                  },
                ),
                new RaisedButton(
                  color: Colors.black,
                  child: Text('scrollTabsDemo',style: TextStyle(color: Colors.yellow)),
                  onPressed: (){
                    Application.router.navigateTo(context, "/scroll-tabs-demo");
                  },
                ),
                new RaisedButton(
                  color: Colors.black,
                  child: Text('gridListDemo',style: TextStyle(color: Colors.blue)),
                  onPressed: (){
                    Application.router.navigateTo(context, "/grid-list-demo");
                  },
                ),
                new RaisedButton(
                  color: Colors.black,
                  child: Text('clipboardData',style: TextStyle(color: Colors.green)),
                  onPressed: (){
                    copyToClipboard('bainana',context);
                  },
                ),
                new RaisedButton(
                  color: Colors.pink,
                  child: Text('sharedPreferences',style: TextStyle(color: Colors.white)),
                  onPressed: (){
                    Application.router.navigateTo(context, "/shared-preferences-demo");
                  },
                ),
                new RaisedButton(
                  color: Colors.pink,
                  child: Text('videoPlayer',style: TextStyle(color: Colors.white)),
                  onPressed: (){
                    Application.router.navigateTo(context, "/video-player-demo");
                  },
                ),
                new RaisedButton(
                  color: Colors.pink,
                  child: Text('animation',style: TextStyle(color: Colors.white)),
                  onPressed: (){
                    Application.router.navigateTo(context, "/animation-demo");
                  },
                ),
                new RaisedButton(
                  color: Colors.blue,
                  child: Text('countBloc',style: TextStyle(color: Colors.white)),
                  onPressed: (){
                    Application.router.navigateTo(context, "/count-bloc-demo");
                  },
                ),
                new RaisedButton(
                  color: Colors.blue,
                  child: Text('categoies',style: TextStyle(color: Colors.white)),
                  onPressed: (){
                    Application.router.navigateTo(context, "/categories");
                  },
                ),
                new RaisedButton(
                  color: Colors.blue,
                  child: Text('login',style: TextStyle(color: Colors.white)),
                  onPressed: _login,
                ),
                new RaisedButton(
                  color: Colors.blue,
                  child: Text('item',style: TextStyle(color: Colors.white)),
                  onPressed: (){
                    Application.router.navigateTo(context, "/item");
                  },
                ),
              ],
            ),
          ),
          new Item()
        ],
      ),
    );
  }
}

