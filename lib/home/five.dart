import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import './../store/store.dart' show AppState;
import '../store/reducer/userInfo_reducer.dart' show UserInfoAction;
import '../modal/user_info.dart';
import '../routers/application.dart';
import '../modal/toast.dart' show Toast;

class Five extends StatefulWidget {
  @override
  _FiveState createState() => _FiveState();
}

class _FiveState extends State<Five> with TickerProviderStateMixin{
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  void _showNotImplementedMessage(context) {
    Navigator.pop(context); // Dismiss the drawer.
    _scaffoldKey.currentState.showSnackBar(const SnackBar(
        content: Text("The drawer's items don't do anything")
    ));
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
          key: _scaffoldKey,
          appBar: AppBar(
            title: Text('five'),
          ),
          /*drawer: new Drawer(
            child: new Column(
              children: <Widget>[
                Text('lasdjflasdjflasdjfaflsdjf')
              ],
            ),
          ),*/
          body: Column(
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
              Text(male),
              FloatingActionButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context){
                        /* return new CustomScrollView(
                          slivers: <Widget>[
                            SliverList(
                                delegate: new SliverChildBuilderDelegate(
                                  (BuildContext context,int index){
                                    return bottomList[index];
                                  },
                                  childCount: bottomList.length,
                                ),
                            )
                          ],
                        );*/
                        return new ListView.builder(
                          itemBuilder: (BuildContext context ,int index){
                            return bottomList[index];
                          },
                          itemCount: bottomList.length,
                        );
                      }
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
                     Toast.toast(context,'tosatalfldjjkflljfladsfjlsdfjasdlfjasldkfjaksldfjaksldfj');

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
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }
}

