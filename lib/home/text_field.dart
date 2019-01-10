import 'package:flutter/material.dart';
import 'package:common_utils/common_utils.dart';
class TextFieldPage extends StatefulWidget {
  @override
  _TextFieldPageState createState() => _TextFieldPageState();
}

class _TextFieldPageState extends State<TextFieldPage> {
  TextEditingController _unameController = new TextEditingController();
  bool _switchSelected = true;
  bool _checkboxSelected = true;
  TimerUtil timerUtil = new TimerUtil(mInterval: 1000);
  String timeDownCount;

  getTime(){
    timerUtil.setOnTimerTickCallback((int value){
      if(DateTime.now().hour == 12 && DateTime.now().minute == 1 && DateTime.now().second == 1){
        print("开始执行");
      }
//      LogUtil.e("TimerTick:" + value.toString());
    });
    timerUtil.startTimer();
  }

  timeDown(){
    TimerUtil timerCountDown = new TimerUtil(mInterval: 1000,mTotalTime: 30*1000);
    timerCountDown.cancel();
    timerCountDown.setOnTimerTickCallback((int value){
      double tick = (value/1000);
      setState(() {
        timeDownCount = tick.toString();
      });
      LogUtil.e("countDown:" + tick.toInt().toString());
    });
    timerCountDown.startCountDown();
  }

  @override
  void dispose() {
    //为了避免内存泄露，需要调用_controller.dispose
    timerUtil.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('textField'),
      ),
      body: new Center(
        child: new Column(
          children: <Widget>[
            new TextField(
              controller: _unameController,
              decoration: InputDecoration(
                labelText: "用户名",
                hintText: "请输入用户名",
                prefixIcon: Icon(Icons.person)
              ),
              onChanged: (v){
                print("onChange:$v");
              },
            ),
            Text("${timeDownCount}s"),
            new RaisedButton(
              onPressed: (){
                print(_unameController.text);
                getTime();
              },
              child: Text('确定:RaiseBtn'),
              color: Colors.blue,
              highlightColor: Colors.blue[700],
              shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
              splashColor: Colors.grey,
              colorBrightness: Brightness.dark,
            ),
            new FlatButton(
              onPressed: (){
                print(1111);
                timeDown();
              },
              child: Text('flatBtn'),
              color: Colors.blue,
              highlightColor: Colors.blue[700],
              shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
              splashColor: Colors.grey,
              colorBrightness: Brightness.dark,
            ),
            new OutlineButton(
              onPressed: null,
              child: Text('OutlineBtn'),
              color: Colors.blue,
              highlightColor: Colors.blue[700],
              shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
              splashColor: Colors.grey,
            ),
            new Switch(
              value: _switchSelected,
              onChanged: (value){
                setState(() {
                  _switchSelected = value;
                });
                print(this._switchSelected);
              }
            ),
            new Checkbox(
              value: _checkboxSelected,
              activeColor: Colors.red, //选中时的颜色
              onChanged:(value){
                setState(() {
                  _checkboxSelected=value;
                });
              } ,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
          new Container(
            child: new Container(
//              color: Colors.purple,
              child: new Text(" ", style: new TextStyle(fontSize: 20.0)),
            ),
            alignment: Alignment.center,
            width: 200.0,
            height: 200.0,
            decoration: new BoxDecoration(
                gradient: const RadialGradient(
                    colors: [Colors.yellowAccent, Colors.yellow, Colors.purple]
                ),
              borderRadius: BorderRadius.circular(100.0)
            ),
            foregroundDecoration: new BoxDecoration(
              border: new Border.all(
                  color: Colors.redAccent, width: 10.0, style: BorderStyle.solid),
              borderRadius: BorderRadius.circular(100.0)
            ),
            margin: const EdgeInsets.all(20.0),
            )
          ],
        ),
      ),
    );
  }
}
