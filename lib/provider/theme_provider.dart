import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/theme_data.dart';

class ThemeProvider with ChangeNotifier {
  final String key = 'theme';
  bool _darkTheme = false;
  SharedPreferences pref;

  ThemeProvider() {
    _loadData();
  }

  Future initialPref() async {
    if (pref == null) {
      pref = await SharedPreferences.getInstance();
    }
  }

  bool get isDarkTheme => _darkTheme;
  ThemeData get getTheme {
    return _darkTheme ? darkTheme : lightTheme;
  }

  toggleTheme() {
    _darkTheme = !_darkTheme;
    pref.setBool(key, _darkTheme);
    notifyListeners();
  }

  _loadData() async {
    await initialPref();
    _darkTheme = pref.getBool(key) ?? false;
    notifyListeners();
  }
}
