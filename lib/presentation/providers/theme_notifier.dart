import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../data/local/share_preference.dart';

class ThemeNotifier with ChangeNotifier {
  SharedPreference darkThemePreference = SharedPreference();
  bool _darkTheme = false;

  ThemeNotifier();

  bool get darkTheme => _darkTheme;


  set darkTheme(bool value) {
    _darkTheme = value;
    darkThemePreference.setDarkTheme(value);
    notifyListeners();
  }
}
