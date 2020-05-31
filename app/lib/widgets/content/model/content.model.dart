import 'package:flutter/cupertino.dart';

class ContentModel with ChangeNotifier {
  int _selectedIndex = 0;

  getIndex() => _selectedIndex;

  changePage(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
