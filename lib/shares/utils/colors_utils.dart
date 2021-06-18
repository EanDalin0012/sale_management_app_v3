import 'package:flutter/material.dart';
import 'package:sale_management/shares/statics/dark_mode.dart';

class ColorsUtils {
  static Color scaffoldBackgroundColor() {
    return Color(0xff273955);
    //return Color(0xff14171C);
    // return DarkMode.isDarkMode == true ? Color(0xff333436) : Colors.white;
  }

  static Color textTheme() {
    return DarkMode.isDarkMode == true ? Colors.white : Color(0xFF222B45);
  }

  static Color toastBackgroundContainer() {
    return Color(0xff273965);
    return DarkMode.isDarkMode == true ? Color(0xff242527) : Colors.greenAccent;
  }

  static Color borderSideColor() {
    return DarkMode.isDarkMode == true ? Colors.white : Color(0xFF222B45);
  }

  static Color? svgPictureSufFixIconColor() {
    return Colors.white;
    // return DarkMode.isDarkMode == true ? Colors.white : null;
  }

  static Color iConColor() {
    return Colors.white;
    // return DarkMode.isDarkMode == true ? Colors.white : Colors.black45;
  }

  static Color isDarkModeColor() {
    return Colors.white;
    //return DarkMode.isDarkMode == true ? Colors.white : Colors.black;
  }

  static Color unselectedWidgetColor() {
    return Colors.white;
    // return DarkMode.isDarkMode == true ? Colors.white.withOpacity(0.8) : Colors
    //     .black45;
  }

  static Color buttonContainer() {
    return Color(0xff273955);
    // return DarkMode.isDarkMode == true ? Color(0xff242527) : Colors.red;
  }

  static Color buttonColorContainer() {
    return DarkMode.isDarkMode == true ? Colors.white : Colors.white;
  }

  static Color? appBarBackGround() {
    return Color(0xff273955);
    //return Color(0xFF22293D);
    //return DarkMode.isDarkMode == true ? Color(0xff242527) : Colors.purple[900];
  }

  static Color? twoTabContainer() {
    //return DarkMode.isDarkMode ?  Color(0xff2f3953) : Color(0xff2f3953);
    return Color(0xff2f3953);
  }
  static Color? floatingActionButton() {
    //return DarkMode.isDarkMode ?  Color(0xff2f3953) : Color(0xff2f3953);
    return Color(0xFF222B45);
  }

  static Color? offsetPopup() {
    //return DarkMode.isDarkMode ?  Color(0xff2f3953) : Color(0xff2f3953);
    return Color(0xff273965);
  }

}