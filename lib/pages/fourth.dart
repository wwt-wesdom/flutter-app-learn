import 'package:flutter/material.dart';
import '../routers/application.dart';
import 'dart:ui' as ui;
import 'dart:core';
import 'dart:typed_data';
import 'package:flutter/rendering.dart';

class Fourth extends StatefulWidget {
  @override
  _FourthState createState() => _FourthState();
}

class _FourthState extends State<Fourth> {
  GlobalKey rootWidgetKey = GlobalKey();

  List<Uint8List> images = List();

  _capturePng(context) async {
    try {
      RenderRepaintBoundary boundary =
      rootWidgetKey.currentContext.findRenderObject();
      var image = await boundary.toImage(pixelRatio: 3.0);
      ByteData byteData = await image.toByteData(format:ui.ImageByteFormat.png);
      Uint8List pngBytes = byteData.buffer.asUint8List();
      images.clear();
      images.add(pngBytes);
      this.showDialogFun(context);
      setState(() {});
      return pngBytes;
    } catch (e) {
      print(e);
    }
    return null;
  }

  void saveImage() async {
    /*var filePath = await ImagePickerSaver.saveFile(fileData: images[0]);
    if(filePath != null){
      Toast.toast(context:context, msg:'保存成功');
    }*/
  }

  showDialogFun(BuildContext context){
    showDialog(context:context,
      builder:(context)=> AlertDialog(
        title: Image.memory(images[0],fit: BoxFit.cover,),
        actions: <Widget>[
          FlatButton(onPressed: (){
            saveImage();
            Navigator.of(context).pop();
          }, child: Text('确定')),
          FlatButton(onPressed: (){
            Navigator.of(context).pop();
          }, child: Text('取消')),
        ],
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('fourth'),
      ),
      body: SingleChildScrollView(
        child: ListView(
          children: <Widget>[
            Center(
              child: RaisedButton(
                onPressed: (){

                },
                child: Text('蓝色主题',style: TextStyle(color: Colors.blue,)),
              ),
            ),
            Center(
              child: RaisedButton(
                onPressed: (){
                },
                child: Text('绿色主题',style: TextStyle(color: Colors.blue),),
              ),
            ),
            Center(
              child: RaisedButton(
                onPressed: (){
                  Application.router.navigateTo(context, "/six");
                },
                child: Text('six',style: TextStyle(color: Colors.blue),),
              ),
            ),
            Center(
              child: RaisedButton(
                onPressed: (){
                  Application.router.navigateTo(context, "/five");
                },
                child: Text('five',style: TextStyle(color: Colors.black)),
              ),
            ),
            Center(
              child: RaisedButton(
                onPressed: (){
                  Application.router.navigateTo(context, "/sliver-app-bar");
                },
                child: Text('sliverAppBar',style: TextStyle(color: Colors.black)),
              ),
            ),
            Center(
              child: RaisedButton(
                onPressed: (){
                  Application.router.navigateTo(context, "/sliver-header");
                },
                child: Text('sliverHeader',style: TextStyle(color: Colors.grey)),
              ),
            ),
            Center(
              child: RaisedButton(
                onPressed: (){
                  Application.router.navigateTo(context, "/categories");
                },
                child: Text('categories',style: TextStyle(color: Colors.blue)),
              ),
            ),
            RepaintBoundary(
              key: rootWidgetKey,
              child: Image(image: NetworkImage("http://qiniu.nightfarmer.top/test.gif"),width: 300,height: 300,),
            ),
            Center(
              child: RaisedButton(
                onPressed: (){
                  print('截图');
                  this._capturePng(context);
                },
                child: Text('点击截图',style: TextStyle(color: Colors.blue),),
              ),
            ),
            /* Expanded(
                child: ListView.builder(
                  itemBuilder: (context ,index){
                    return Image.memory(images[index],fit: BoxFit.cover,);
                  },
                  itemCount: images.length,
                )
              )*/
          ],
        ),
      ),
    );
  }
}
