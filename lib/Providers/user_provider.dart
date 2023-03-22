import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:omega_app/Exceptions/fail_register_user.dart';
import 'package:omega_app/Exceptions/no_fetched_user.dart';
import 'package:omega_app/Services/user_service.dart';

import '../Models/user.dart';

class UserProvider extends ChangeNotifier{
  List<User> _list = [];
  final UserService _userService = UserService();

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

  Future<List<User>> fetch() async{
    try{
      final List<User> users = await _userService.getAll();
      _list = users;
      saveAll(users);
      return _list;
    }catch(e){

      throw NoUserFetchedException();
    }
  }

  void userRegister({required String userName, required userPhoto}){
    try{
      _userService.post(User(userName: userName, userPhoto: userPhoto));

    }catch(ex){
        throw FailRegisterUserException();
    }
    notifyListeners();
  }


}