import 'package:flutter/cupertino.dart';

class AppModel with ChangeNotifier {
  bool _isLogged = false;

  getCurrentState() => _isLogged;

  changePage() {
    _isLogged = !_isLogged;
    notifyListeners();
  }
}