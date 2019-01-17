import 'package:rxdart/rxdart.dart';
import 'dart:async';

class CountBLoC {
  int _count = 0;

  BehaviorSubject<int> _subject = BehaviorSubject<int>();
  Stream<int> get stream => _subject.stream;
  Sink<int> get value => _subject.sink;

  void increment(){
    value.add(++_count);
    print(_count);
  }

  void dispose() {
    _subject.close();
  }
}


