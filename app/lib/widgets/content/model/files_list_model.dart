import 'package:flutter/cupertino.dart';

class FilesListModel with ChangeNotifier {
  bool _isAdd = false;

  bool get isAdd => _isAdd;

  changePage() {
    _isAdd = !_isAdd;
    notifyListeners();
  }
}
