
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Demo'),
        ),
        body: Center(
          child: ParentWidget(),
        ),
      ),
    );
  }
}

class ParentWidget extends StatefulWidget {
  @override
  _buildView createState() => _buildView();
}

class _buildView extends State<ParentWidget> {
  //创建buildListView需要的控件
  _getListData() {
    List<Widget> widgets = [];
    for (int i = 0; i < 10000; i++) {
      widgets.add(new Padding(
          padding: new EdgeInsets.all(10.0),
          child: new Text("Row $i")));
    }
    return widgets;
  }
  @override
  Widget build(BuildContext context) {
    return buildListViewTwo(_getListData());
  }
}
//创建ListView or ScrollView
Widget buildListViewOne(List<Widget> widgets) {
  return new ListView(
    children: widgets,
  );
}

Widget buildListViewTwo(List<Widget> widgets) {
  return new ListView.builder(
    //listview的长度相当于getitemcount
      itemCount: widgets.length,
      //listview的子view，相当于adapter中的getView
      itemBuilder: (BuildContext context, int position) {
        return widgets[position];
      });
}
