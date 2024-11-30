import 'package:flutter/foundation.dart';

class FavoriteProvider with ChangeNotifier {
  List<int> _selecteditems = [];

  List<int> get selecteditems => _selecteditems;
  void add(int value) {
    _selecteditems.add(value);
    print(_selecteditems);
    notifyListeners();
  }

  void remove(int value) {
    _selecteditems.remove(value);
    print(_selecteditems);
    notifyListeners();
  }
}
