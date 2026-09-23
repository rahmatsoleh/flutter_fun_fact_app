import 'package:flutter/material.dart';
import "package:shared_preferences/shared_preferences.dart";

class ThemeProvider extends ChangeNotifier {
  bool isDarkModeChecked = false;

  void changeTheme() async {
    isDarkModeChecked = !isDarkModeChecked;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("isDarkMode", isDarkModeChecked);
    notifyListeners();
  }

  void loadMode() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    isDarkModeChecked = prefs.getBool("isDarkMode") ?? false;
    notifyListeners();
  }
}
