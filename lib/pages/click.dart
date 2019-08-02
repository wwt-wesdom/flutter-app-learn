import 'package:flutter/material.dart';
class ClickBtn extends StatefulWidget {
  @override
  _ClickBtnState createState() => _ClickBtnState();
}
class _ClickBtn extends StatelessWidget {
  final String _str;
  final _fun1;
  final int _index;
  const _ClickBtn(this._str,this._fun1,this._index);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: RaisedButton(
          child: Text(_str),
          onPressed: (){
            _fun1(_index);
          }
        )
      ),
    );
  }
}

class _ClickBtnState extends State<ClickBtn> {
  clickFun(index){
    print(index);
  }
  var list = ['apple','arigin','pear'];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context,int index) {
        return _ClickBtn(list[index],clickFun,index);
      },
      itemCount: list.length,

    );
  }
}
