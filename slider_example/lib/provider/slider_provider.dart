import 'package:flutter/material.dart';

class SliderProvider with ChangeNotifier{
  double _value=1.0;
  //getter for value of the slider
  double get value => _value;  
  //setter for the updation of the slider value 
  void setSliderValue(double val){
    _value=val;
    notifyListeners();
  }
}
