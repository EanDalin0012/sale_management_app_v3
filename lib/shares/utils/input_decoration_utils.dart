import 'package:flutter/material.dart';

class InputDecorationUtils {

  static TextStyle inputDecorationLabelStyle() {
    return TextStyle(color: Colors.white);
    // if (DarkMode.isDarkMode == true) {
    //   return TextStyle(color: Colors.white);
    // }
    // return TextStyle(color: Colors.black.withOpacity(0.8));
  }

  static TextStyle inputDecorationHintStyle() {
    return TextStyle(color: Colors.white60);
    // if (DarkMode.isDarkMode == true) {
    //   return TextStyle(color: Colors.white60);
    // }
    // return TextStyle(color: Colors.black54);
  }

  static TextStyle textFormFieldStyle() {
    return TextStyle(color: Colors.white);
    // if (DarkMode.isDarkMode == true) {
    //   return TextStyle(color: Colors.white);
    // }
    // return TextStyle(color: Colors.black);
  }

  static OutlineInputBorder outlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(28),
      borderSide: BorderSide(
        //color: DarkMode.isDarkMode ? Colors.white : Colors.black),
        color: Colors.white,
      ),
      gapPadding: 10,
    );
  }

  static OutlineInputBorder enabledBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(60.0),
      borderSide: BorderSide(
        // color: DarkMode.isDarkMode ? Colors.white : Colors.black87,
        color: Colors.white,
        width: 1.0,
      ),
    );
  }

  static OutlineInputBorder focusedBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(color: Color(0xff273995), width: 2.0),
      borderRadius: BorderRadius.circular(60.0),
    );
    // if(DarkMode.isDarkMode == true) {
    //   return TextStyle(color: Colors.white);
    // }
    // return TextStyle(color: Colors.black.withOpacity(0.8));
  }
}
