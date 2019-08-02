import 'package:flutter/material.dart';
import 'horse_list.dart';
class First extends StatefulWidget {
  @override
  _FirstState createState() => _FirstState();
}

class _FirstState extends State<First> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      child: HorseList(),
    );
  }
}
