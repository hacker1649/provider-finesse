import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier{
  var _themeMode=ThemeMode.light;
  //getter for variable themeMode 
  ThemeMode get themeMode => _themeMode;
  //setter for variable themeMode
  void setTheme(themeMode){
    _themeMode=themeMode;
    notifyListeners();
  }
}
