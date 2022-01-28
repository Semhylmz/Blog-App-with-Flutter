import 'package:ateizm_fikri/config/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

ThemeData light = ThemeData(
  primaryColor: kPrimaryColor,
  scaffoldBackgroundColor: Colors.white,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  appBarTheme: AppBarTheme(color: kPrimaryColor, elevation: 2),
  iconTheme: IconThemeData(color: kContentColorLightTheme),
  colorScheme: ColorScheme.light(
    brightness: Brightness.light,
    primary: kPrimaryColor,
    secondary: kSecondaryColor,
    error: kErrorColor,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: kContentColorLightTheme1,
    selectedItemColor: kPrimaryColor,
    unselectedItemColor: kContentColorLightTheme.withOpacity(0.32),
    selectedIconTheme: IconThemeData(color: kPrimaryColor),
    showUnselectedLabels: true,
  ),
);

ThemeData dark = ThemeData(
  primaryColor: kDarkColor,
  scaffoldBackgroundColor: kContentColorDarkTheme,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  appBarTheme: AppBarTheme(color: kDarkColor, elevation: 2),
  iconTheme: IconThemeData(color: kContentColorLightTheme),
  colorScheme: ColorScheme.dark().copyWith(
    brightness: Brightness.dark,
    primary: kPrimaryColor,
    secondary: kSecondaryColor,
    error: kErrorColor,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: kDarkColor,
    selectedItemColor: Colors.white70,
    unselectedItemColor: kContentColorDarkTheme.withOpacity(0.32),
    selectedIconTheme: IconThemeData(color: Colors.white),
    unselectedIconTheme: IconThemeData(color: Colors.grey),
    showUnselectedLabels: true,
  ),
);

class ThemeColorData with ChangeNotifier {
  static SharedPreferences? _sharedPreferences;

  bool _isLight = true;

  bool get isLight => _isLight;

  ///ThemeData get themeColor => _isLight ? light : dark;
  ThemeData get themeColor => light;

  void switchTheme(bool value) {
    _isLight = value;
    saveTheme(value);
    notifyListeners();
  }

  Color get colorBackground => _isLight ? Colors.black12 : kDarkColor;

  Future<void> createSharedPrefObject() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  void saveTheme(bool value) async {
    _sharedPreferences!.setBool('themeData', value);
  }

  void loadTheme() async {
    await createSharedPrefObject();
    _isLight = _sharedPreferences!.getBool('themeData') ?? true;
  }
}
