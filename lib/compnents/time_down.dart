import 'package:flutter/material.dart';
import 'package:common_utils/common_utils.dart';

class TimeDown extends StatefulWidget {
  final int time;
  TimeDown(this.time);
  @override
  _TimeDownState createState() => _TimeDownState();
}

class _TimeDownState extends State<TimeDown> {
  TimerUtil timerCountDown;
  void initState(){
    super.initState();
    timerCountDown = new TimerUtil(mInterval: 1000,mTotalTime: (widget.time - DateUtil.getNowDateMs()));
    timeDown(widget.time);
  }

  String timeString;
  timeDown(time){
    if (time - DateUtil.getNowDateMs() <= 0){
      setState(() {
        timeString = '倒计时结束';
      });
      return;
    }else{
      timerCountDown.setOnTimerTickCallback((int value){
        double tick = (value/1000);
        int leftTime = tick.toInt();
        double dayDouble = (leftTime/(24*60*60));
        String day = dayDouble.toInt().toString();
        double hourDouble = (leftTime/(60*60)%24);
        String hour = hourDouble.toInt().toString();
        double minDouble = (leftTime / 60 % 60);
        String min = minDouble.toInt().toString();
        String s = (leftTime % 60).toString();
        setState(() {
          timeString = "$day天$hour小时$min分$s秒";
        });
      });
      timerCountDown.startCountDown();
    }
  }
  @override
  void dispose(){
    timerCountDown.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Text(timeString);
  }
}
