import 'package:flutter/material.dart';

class SectionVisibilityProvider extends ChangeNotifier {
  final Map<String, bool> _visibleSections = {
    'hero': true,
    'about': false,
    'skills': false,
    'projects': false,
  };

  Map<String, bool> get visibleSections => _visibleSections;

  void setVisible(String section) {
    if (_visibleSections.containsKey(section) && !_visibleSections[section]!) {
      _visibleSections[section] = true;
      notifyListeners();
    }
  }
}
