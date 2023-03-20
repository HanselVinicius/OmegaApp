import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:omega_app/Services/user_service.dart';

import '../Models/user.dart';

class UserProvider extends ChangeNotifier{
  List<User> _list = [];
  final UserService userService = UserService();

  UnmodifiableListView<User> get list => UnmodifiableListView(_list);

  void saveAll(List<User> users){
    for(var user in users){
      if(!_list.contains(user)){
        _list.add(user);
      }
    }
    notifyListeners();
  }

  void remove(User user){
    _list.remove(user);
    notifyListeners();
  }

}