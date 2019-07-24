import 'package:flutter/material.dart';
class DialogsDemo extends StatefulWidget {
  @override
  _DialogsDemoState createState() => _DialogsDemoState();
}

class _DialogsDemoState extends State<DialogsDemo> {
  TimeOfDay _selectedTime;
  DateTime date;
  @override
  void initState(){
    super.initState();
    final DateTime now = DateTime.now();
    _selectedTime = TimeOfDay(hour: now.hour, minute: now.minute);
    DateTime _fromDateTime = DateTime.now();
    date = DateTime(_fromDateTime.year,_fromDateTime.month,_fromDateTime.day);
  }
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: const Text('dialog'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            new TextField(
              decoration: const InputDecoration(
                labelText: 'location'
              ),
              style: Theme.of(context).textTheme.display1.copyWith(fontSize: 20.0),
            ),
            new RaisedButton(
              onPressed: (){
                showTimePicker(
                  context: context,
                  initialTime: _selectedTime
                ).then((TimeOfDay value){
                  if(value !=null && value != _selectedTime){
                    _selectedTime = value;
                    print(value.format(context));
                  }
                });
              },
              child: Text('CONFIRMATION'),
            ),
            new RaisedButton(
              onPressed: (){
                showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: new DateTime(1970),
                  lastDate: new DateTime(2060)
                ).then((DateTime value){
                  if(value != null){
                  }
                });
              },
              child: Text('Fullscreen',style: TextStyle(color: Colors.blue),),
            ),
          ],
        ),
      ),
    );
  }
}
