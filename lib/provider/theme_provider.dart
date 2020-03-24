import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  ThemeData dark() {
    return ThemeData.dark().copyWith(cardColor: Colors.black54);
  }

  ThemeData light() {
    return ThemeData.light().copyWith(
      appBarTheme: AppBarTheme(
        color: Colors.orange
      )
    );
  }

  bool get isDarkTheme => _darkTheme;
  ThemeData get getTheme {
    return _darkTheme ? dark() : light();
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
