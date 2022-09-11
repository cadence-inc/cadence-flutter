import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  String userId;

  UserProvider({this.userId = ''});

  void setUserId(String userId) {
    this.userId = userId;
    notifyListeners();
  }

  void logOut() {
    this.userId = '';
    notifyListeners();
  }
}
