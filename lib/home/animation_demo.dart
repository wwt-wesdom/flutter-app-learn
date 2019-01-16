import 'package:flutter/material.dart';
class AnimationDemo extends StatefulWidget {
  @override
  _AnimationDemoState createState() => _AnimationDemoState();
}

class _AnimationDemoState extends State<AnimationDemo>  with SingleTickerProviderStateMixin{
  Animation<double> animation;
  AnimationController controller;
  double begin = 100.0;
  double end = 300.0;
  @override
  void initState() {
    super.initState();
    controller = new AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2)
    );
    animation = CurvedAnimation(parent: controller, curve: Curves.bounceIn);
    animation = new Tween(
      begin: begin,
      end: end
    ).animate(controller)
      ..addListener((){
        if(controller.value == 1.0){
          /*begin = 300.0;
          end = 100.0;*/
          controller.reverse();
        }else if(controller.value == 0.0){
        /*  begin = 100.0;
          end = 300.0;*/
          controller.forward();
        }
        setState(() {
        });
      });
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('animation demo'),
      ),
      body: Center(
        child: Image.asset(
          "assets/images/food06.jpeg",
          width: animation.value,
          height: animation.value,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          /*if(animation.value == 300){
            controller.reset();
          }else {
            controller.forward();//启动动画正向执行
          }*/
          controller.forward();
        },
        child: Icon(Icons.insert_photo),
      ),
    );
  }
}
