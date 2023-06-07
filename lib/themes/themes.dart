import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  // Customize other properties like primaryColor, accentColor, etc.
);


ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  // Customize other properties like primaryColor, accentColor, etc.
);


class ThemeProvider with ChangeNotifier {
  ThemeData _currentTheme = lightTheme;

  ThemeData get currentTheme => _currentTheme;

  void toggleTheme() {
    _currentTheme =
    _currentTheme == lightTheme ? darkTheme : lightTheme;
    notifyListeners();
  }
}
