import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sale_management/shares/statics/dark_mode.dart';
import 'package:sale_management/shares/statics/fonts.dart';
import 'package:sale_management/shares/utils/colors_utils.dart';

class OverListItem extends StatelessWidget {
  final String text;
  final int length;

  const OverListItem({Key? key, required this.text, required this.length})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var color = Color(0xFF222B45).withOpacity(0.3);
    if (DarkMode.isDarkMode == true) {
      color = Color(0xFF222B45);
    }
    return Container(
      color: color,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(
          left: 20,
          top: 10,
          right: 20,
          bottom: 10
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            text.toString(),
            style: TextStyle(
                color: ColorsUtils.isDarkModeColor(),
                fontSize: 18,
                fontWeight: FontWeight.w500,
                fontFamily: fontDefault),
          ),
          Text(this.length.toString(), style: TextStyle(
              color: ColorsUtils.isDarkModeColor(),
              fontSize: 18,
              fontWeight: FontWeight.w700,
              fontFamily: fontDefault),)
        ],
      ),
    );
  }
}
