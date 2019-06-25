import 'package:flutter/material.dart';
import 'dart:async' show Timer;

class Item extends StatefulWidget {
  final double height;
  Item({this.height: 60});
  ItemState createState() => ItemState();
}

class ItemState extends State<Item> {
  double left;
  double start;
  double right;
  bool flag;
  Timer _timer;
  void initState() {
    super.initState();
    left = 0.0;
    right = 0.0;
  }
  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: widget.height,
      child: Stack(
        overflow: Overflow.clip,
        children: <Widget>[
          Container(
          ),
          Positioned(
            right: right,
            child: Container(
              width: width,
              height: widget.height,
              child: GestureDetector(
                child: Container(
                  height: 80,
                  width: width,
                  color: Colors.yellow,
                ),
                onHorizontalDragStart: (details) {
                  setState(() {
//                    right = 0;
                    start = details.globalPosition.dx;
                  });
                },
                onHorizontalDragUpdate: (details) {
                  double v = start - details.globalPosition.dx;
                  double r;
                  if (v >=0 && v<=60) {
                    r = v;
                  } else if (v > 60) {
                    r = 60;
                  } else if (v < 0) {
                    if (v > -60 && right > 0) {
                      r =  60 + v;
                    } else {
                      r = 0;
                    }
                  }
                  setState(() {
                    right = r;
                  });
                },
                onHorizontalDragEnd: (details) {
                  if (right > 30) {
                    setState(() {
                      right = 60;
                    });
                  } else {
                    setState(() {
                      right = 0;
                    });
                  }
                },
                onTap: () {
                  if (right == 0) return;
                  _timer = new Timer.periodic(Duration(milliseconds: 1), (Timer timer) {
                    right = right - 1;
                    setState(() {
                    });
                    if (right == 0) {
                      timer.cancel();
                    }
                  });
                },
              ),
            ),
          ),
          Positioned(
            right: right-60,
            top: 0,
            child: Container(
              width: 60,
              height: widget.height,
              alignment: Alignment.center,
              color: Colors.red,
              child: InkWell(
                child: Text('delete', style: TextStyle(color: Colors.white),),
              ),
            ),
          )
        ],
      ),
    );
  }
}