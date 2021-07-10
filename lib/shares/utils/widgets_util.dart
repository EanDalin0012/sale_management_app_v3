import 'package:flutter/material.dart';
import 'package:sale_management/shares/statics/dark_mode.dart';
import 'package:sale_management/shares/utils/colors_utils.dart';

class WidgetsUtil {

  static AppBar appBar({required String title, Widget? leading, List<
      Widget>? actions, PreferredSizeWidget? bottom, double? elevation}) {
    return AppBar(
      // backgroundColor: Colors.purple[900],
      title: Text(title),
      leading: leading,
      actions: actions,
      elevation: elevation,
      bottom: bottom,
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

  InputDecorationTheme inputDecorationTheme() {
    OutlineInputBorder outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(28),
      borderSide: BorderSide(color: Color(0xFFEDE8FF)),
      gapPadding: 10,
    );
    return InputDecorationTheme(
      floatingLabelBehavior: FloatingLabelBehavior.always,
      contentPadding: EdgeInsets.symmetric(horizontal: 42, vertical: 20),
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      border: outlineInputBorder,
    );
  }

  static Widget overlayKeyBardContainer({required String text}) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        color: ColorsUtils.buttonContainer(),
        border: Border(
          top: BorderSide( //                    <--- top side
            color: Colors.white,
            width: 0.5,
          ),
        ),
      ),
      child: Center(child: Text(text, style: TextStyle(
          fontWeight: FontWeight.w700,
          color: ColorsUtils.buttonColorContainer(),
          fontSize: 18))),
    );
  }

// static Widget floatingActionButton({String? tooltip, required VoidCallback onPressed}) {
//   return InkWell(
//     onHover: (value) {
//
//     },
//     child: Container(
//         height: 45,
//         width: 45,
//         padding: EdgeInsets.all(2),
//         decoration: BoxDecoration(
//             color: Color(0xff6E747F),
//             borderRadius: BorderRadius.circular(50)
//         ),
//         child: Center(child: FaIcon(FontAwesomeIcons.plusCircle, size: 25, color: Colors.white,))
//     ),
//   );
//   return FloatingActionButton(
//     backgroundColor: ColorsUtils.floatingActionButton(),
//     onPressed: () => onPressed(),
//     tooltip: tooltip,
//     elevation: 0,
//     child:  FaIcon(
//         FontAwesomeIcons.plusCircle, color: Colors.white, size: 35
//     ),
//   );
// }

}
