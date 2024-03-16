import 'package:flutter/cupertino.dart';

class SayacModel with ChangeNotifier{
  int _counter = 0;


  int get counter => _counter;

  set counter(int value) {
    _counter = value;
  }

  void incrementCounter() {

    _counter++;
    notifyListeners();

  }
}