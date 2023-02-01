import 'package:flutter/material.dart';


class HomeScreenProvider with ChangeNotifier{
  bool _liked= false;

  bool get liked => _liked;

  void setLike(bool val){
    _liked = val;
    notifyListeners();
  }
}