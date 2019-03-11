import 'package:flutter/material.dart';
import '../routers/application.dart';
import '../modal/toast.dart' show Toast;
import 'package:flutter/services.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'dart:async';

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
    print(result);
    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final FacebookAccessToken accessToken = result.accessToken;
        print(accessToken.token);
        break;
      case FacebookLoginStatus.cancelledByUser:
        print('Login cancelled by the user.');
        break;
      case FacebookLoginStatus.error:
        print('Something went wrong with the login process.\n'
            'Here\'s the error Facebook gave us: ${result.errorMessage}');
        break;
    }
  }

  Future<Null> _logOut() async {
    await facebookSignIn.logOut();
    print('Logged out.');
  }


  @override
  void initState() {
    print("five");
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
              print('Camera$i');
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
              print(_scaffoldKey.currentContext);
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
//                          borderRadius: BorderRadius.circular(55.0),
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
          new Row(
            children: <Widget>[
              new Container(width: 5.0,),
              new RaisedButton(
                child: Text('TextField'),
                onPressed: (){
                  Application.router.navigateTo(context, "/text-field");
                },
              ),
              new Container(width: 5.0,),
              new RaisedButton(
                child: Text('Dialogs',style: TextStyle(color: Colors.red)),
                onPressed: (){
                  Application.router.navigateTo(context, "/dialogs-demo");
                },
              ),
              new Container(width: 5.0,),
              new RaisedButton(
                child: Text('Drawer',style: TextStyle(color: Colors.blue)),
                onPressed: (){
                  Application.router.navigateTo(context, "/drawer-demo");
                },
              ),
              new Container(width: 5.0,),
              new RaisedButton(
                child: Text('toast',style: TextStyle(color: Colors.blue)),
                onPressed: (){
                  Toast.toast(context:context,msg:'123456789',second: 500);

                },
              ),
            ],
          ),
          new Row(
            children: <Widget>[
              new Container(width: 5.0,),
              new RaisedButton(
                color: Colors.black,
                child: Text('scrollTabsDemo',style: TextStyle(color: Colors.yellow)),
                onPressed: (){
                  Application.router.navigateTo(context, "/scroll-tabs-demo");
                },
              ),
              new Container(width: 5.0,),
              new RaisedButton(
                color: Colors.black,
                child: Text('gridListDemo',style: TextStyle(color: Colors.blue)),
                onPressed: (){
                  Application.router.navigateTo(context, "/grid-list-demo");
                },
              ),
              new Container(width: 5.0,),
              new RaisedButton(
                color: Colors.black,
                child: Text('clipboardData',style: TextStyle(color: Colors.green)),
                onPressed: (){
                  copyToClipboard('bainana',context);
                },
              ),
            ],
          ),
          new Row(
            children: <Widget>[
              new Container(width: 5.0,),
              new RaisedButton(
                color: Colors.pink,
                child: Text('sharedPreferences',style: TextStyle(color: Colors.white)),
                onPressed: (){
                  Application.router.navigateTo(context, "/shared-preferences-demo");
                },
              ),
              new Container(width: 5.0,),
              new RaisedButton(
                color: Colors.pink,
                child: Text('videoPlayer',style: TextStyle(color: Colors.white)),
                onPressed: (){
                  Application.router.navigateTo(context, "/video-player-demo");
                },
              ),
              new Container(width: 5.0,),
              new RaisedButton(
                color: Colors.pink,
                child: Text('animation',style: TextStyle(color: Colors.white)),
                onPressed: (){
                  Application.router.navigateTo(context, "/animation-demo");
                },
              )
            ],
          ),
          new Row(
            children: <Widget>[
              new Container(width: 5.0,),
              new RaisedButton(
                color: Colors.blue,
                child: Text('countBloc',style: TextStyle(color: Colors.white)),
                onPressed: (){
                  Application.router.navigateTo(context, "/count-bloc-demo");
                },
              ),
              new Container(width: 5.0,),
              new RaisedButton(
                color: Colors.blue,
                child: Text('categoies',style: TextStyle(color: Colors.white)),
                onPressed: (){
                  Application.router.navigateTo(context, "/categories");
                },
              ),
              new Container(width: 5.0,),
              new RaisedButton(
                color: Colors.blue,
                child: Text('login',style: TextStyle(color: Colors.white)),
                onPressed: _login,
              ),
            ],
          )
        ],
      ),
    );
  }
}

