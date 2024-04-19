import 'package:flutter/material.dart';

class FavoriteProvider with ChangeNotifier{
  final List<int> _favoriteItems=[];
  //getter for the favorite items list
  List<int> get favoriteItems => _favoriteItems; 
  //setters for the favorite items list
  void addItem(int item){
    _favoriteItems.add(item);
    notifyListeners();
  }
  void removeItem(int item){
    _favoriteItems.remove(item);
    notifyListeners();
  }
  void removeItemAtIndex(int index){
    _favoriteItems.removeAt(index);
    notifyListeners();
  }
}
