import 'package:flutter/material.dart';
class TextFieldPage extends StatefulWidget {
  @override
  _TextFieldPageState createState() => _TextFieldPageState();
}

class _TextFieldPageState extends State<TextFieldPage> {
  TextEditingController _unameController = new TextEditingController();
  bool _switchSelected = true;
  bool _checkboxSelected = true;
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
            new RaisedButton(
              onPressed: (){
                print(_unameController.text);
              },
              child: Text('确定:RaiseBtn'),
              color: Colors.blue,
              highlightColor: Colors.blue[700],
              shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
              splashColor: Colors.grey,
              colorBrightness: Brightness.dark,
            ),
            new FlatButton(
              onPressed: ()=>{},
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
            )
          ],
        ),
      ),
    );
  }
}
