import 'package:flutter/material.dart';

class CountProvider with ChangeNotifier{
  int _counter=0;
  //getter for count variable 
  int get counter => _counter;
  //setter for count variable
  void setCounter(){
    _counter++;
    notifyListeners();
  }
}
