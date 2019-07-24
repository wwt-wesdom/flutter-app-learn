import 'package:flutter/material.dart';
import 'dart:async' show Future;

enum Gravity {
  BOTTOM, // 提示语位于底部
  CENTER, // 提示语位于中间
  TOP, // 提示语位于顶部
}

/// 轻提示（默认显示2秒）
class Toast {
  static final int short = 1;
  static final int long = 2;
  static void show(String msg, BuildContext context, {
    int duration = 1,
    Gravity gravity = Gravity.CENTER,
    Color backgroundColor = const Color(0xAA000000),
    Color textColor = Colors.white,
    double top = 50.0,
    double bottom = 50.0,
    double backgroundRadius = 4.0}) {
      ToastView.dismiss();
      ToastView.createView(msg, context, duration, gravity, backgroundColor, textColor, backgroundRadius, top, bottom);
  }
}

class ToastView {
  static final ToastView _singleton = ToastView._internal();

  factory ToastView() {
    return _singleton;
  }

  ToastView._internal();

  static OverlayState overlayState;
  static OverlayEntry _overlayEntry;
  static bool _isVisible = false;

  static void createView(String msg, BuildContext context, int duration, Gravity gravity,
    Color background, Color textColor, double backgroundRadius, double top, double bottom) async {
    overlayState = Overlay.of(context);

    Paint paint = Paint();
    paint.strokeCap = StrokeCap.square;
    paint.color = background;

    _overlayEntry = OverlayEntry(
      builder: (BuildContext context) => ToastWidget(
        widget: Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          child: Container(
            decoration: BoxDecoration(
              color: background,
              borderRadius: BorderRadius.circular(backgroundRadius),
            ),
            margin: EdgeInsets.symmetric(horizontal: 20),
            padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
            child:
            Text(msg, softWrap: true, style: TextStyle(
              fontSize: 20.0,
              color: textColor)
            ),
          )),
        gravity: gravity,
        top: top,
        bottom: bottom,
      ),
    );
    _isVisible = true;
    overlayState.insert(_overlayEntry);
    await Future.delayed(Duration(seconds: duration == null ? 1 : duration));
    dismiss();
  }

  static dismiss() async {
    if (!_isVisible) {
      return;
    }
    _isVisible = false;
    _overlayEntry?.remove();
  }
}

class ToastWidget extends StatelessWidget {

  final Widget widget;
  final Gravity gravity;
  final double top;
  final double bottom;

  ToastWidget({
    Key key,
    @required this.widget,
    @required this.gravity,
    this.top,
    this.bottom,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: gravity == Gravity.TOP ? top : null,
      bottom: gravity == Gravity.BOTTOM ? bottom : null,
      child: Material(
        color: Colors.transparent,
        child: widget,
      ));
  }
}
