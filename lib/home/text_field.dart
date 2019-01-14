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
  TimerUtil timerCountDown = new TimerUtil(mInterval: 1000,mTotalTime: (1547535547000 - DateUtil.getNowDateMs()));
  String timeDownCount;
  String getVsCode = '获取验证码';
  double count = 0;
  bool disabled = false;

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
    if(count == 0){
      timerCountDown = new TimerUtil(mInterval: 1000,mTotalTime: (20*1000));
      timerCountDown.cancel();
      timerCountDown.setOnTimerTickCallback((int value){
        double tick = (value/1000);
        count= tick;
        if(count == 0){
          setState(() {
            getVsCode = "获取验证码";
            disabled = false;
          });
        }else{
          setState(() {
            disabled = true;
            timeDownCount = tick.toInt().toString();
            getVsCode = "${timeDownCount}s";
          });
        }

//      LogUtil.e("countDown:" + tick.toInt().toString());
      });
      timerCountDown.startCountDown();
    }
  }

  getDateUtil(){
   print(DateUtil.getNowDateMs()); 
   print(DateUtil.getNowDateStr());
   print(DateUtil.getDateStrByTimeStr("1992-04-02"));
   print(DateUtil.getDateStrByMs(1547199625201)); //根据时间戳获取时间
   print(DateUtil.getDateStrByMs(1547199625201,format: DateFormat.ZH_NORMAL)); //根据时间戳获取时间
   print(DateUtil.getDateStrByMs(1547199625201,format: DateFormat.ZH_YEAR_MONTH_DAY)); //根据时间戳获取时间
   print(DateUtil.getDateStrByDateTime(DateTime.now()));
   print(DateTime.now());
   print(DateUtil.getDayOfYear(DateTime(2019,11,3)));
  }


  @override
  void dispose() {
    //为了避免内存泄露，需要调用_controller.dispose
    timerUtil.cancel();
    timerCountDown.cancel();
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
              disabledColor: Colors.yellow,
            ),
            new FlatButton(
              onPressed: disabled? null : (){
                timeDown();
              },
              child: Text(getVsCode),
              color: Colors.blue,
              highlightColor: Colors.blue[700],
              shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
              splashColor: Colors.grey,
              colorBrightness: Brightness.dark,
              disabledColor: Colors.yellow,
            ),
            new OutlineButton(
              onPressed: (){
                getDateUtil();
              },
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
