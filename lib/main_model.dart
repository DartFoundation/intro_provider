import 'package:flutter/material.dart';

class MainModel extends ChangeNotifier {
  int _counter = 1;
  int get counter => _counter;

  void incrementCounter() {
    print('incrementCounter: $_counter');
    _counter++;
    notifyListeners();
  }
}
