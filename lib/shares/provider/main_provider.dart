import 'package:flutter/material.dart';
import 'package:sale_management/shares/statics/dark_mode.dart';
import 'package:sale_management/shares/statics/fonts.dart';
import 'package:sale_management/shares/utils/colors_utils.dart';
import 'package:sale_management/shares/utils/input_decoration_utils.dart';

class MainProvider extends ChangeNotifier {
  ThemeData themeData = ThemeData.light();
  bool _darkTheme = false;
  bool get darkTheme => DarkMode.isDarkMode;

  set darkTheme(bool value) {
    _darkTheme = value;
    notifyListeners();
  }

  ThemeData theme() {
    return ThemeData(
      scaffoldBackgroundColor: ColorsUtils.scaffoldBackgroundColor(),
      fontFamily: fontDefault,
      appBarTheme: appBarTheme(),
      unselectedWidgetColor: ColorsUtils.unselectedWidgetColor(),
      textTheme: textTheme(),
      inputDecorationTheme: inputDecorationTheme(),
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }

  TextTheme textTheme() {
    return TextTheme(
      bodyText1: TextStyle(color: ColorsUtils.isDarkModeColor()),
      bodyText2: TextStyle(color: ColorsUtils.isDarkModeColor()),

    );
  }

  InputDecorationTheme inputDecorationTheme() {
    OutlineInputBorder outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(50),
      borderSide: BorderSide(color: ColorsUtils.borderSideColor()),
      gapPadding: 10,
    );
    return InputDecorationTheme(
      labelStyle: InputDecorationUtils.inputDecorationLabelStyle(),
      hintStyle: InputDecorationUtils.inputDecorationHintStyle(),
      floatingLabelBehavior: FloatingLabelBehavior.always,
      contentPadding: EdgeInsets.symmetric(horizontal: 42, vertical: 20),
      enabledBorder: InputDecorationUtils.enabledBorder(),
      focusedBorder: InputDecorationUtils.focusedBorder(),
      border: outlineInputBorder,
    );
  }

  static AppBarTheme appBarTheme() {
    var color = Colors.purple[900];
    var iconThemeColor = Colors.white;
    var textThemeColor = Colors.white;
    if (DarkMode.isDarkMode == true) {
      color = Colors.black;
      iconThemeColor = Colors.white;
      textThemeColor = Colors.white;
    }
    return AppBarTheme(
      color: color,
      elevation: 2,
      brightness: Brightness.dark,
      iconTheme: IconThemeData(color: iconThemeColor),
      textTheme: TextTheme(
        headline6: TextStyle(color: textThemeColor, fontSize: 18),
      ),
    );
  }


}