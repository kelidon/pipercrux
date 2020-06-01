import 'package:flutter/cupertino.dart';

class UsersListModel with ChangeNotifier {
  bool _isAdd = false;

  bool get isAdd => _isAdd;

  changePage() {
    _isAdd = !_isAdd;
    notifyListeners();
  }
}
