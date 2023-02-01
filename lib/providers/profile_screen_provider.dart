import 'package:flutter/material.dart';


class ProfileProvider with ChangeNotifier{
  bool _following = false;
  int _nav_activeIndex = 0;
  int _nav_previosIndex = 0;


  bool get  following => _following;
  int get nav_activeIndex => _nav_activeIndex;
  int get nav_previosIndex => _nav_previosIndex; 
  void setFollowing() {
    _following = !_following;
    notifyListeners();
  }

  void setNavActiveIndex(int index){
    _nav_activeIndex = index;
    notifyListeners();
  }

  void setNavPreviousIndex(int index){
    _nav_previosIndex = index;
    notifyListeners();
  }

}