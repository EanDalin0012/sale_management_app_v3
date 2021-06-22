import 'package:flutter/material.dart';
import 'package:sale_management/shares/utils/colors_utils.dart';
import 'package:sale_management/shares/utils/size_config_utils.dart';

class TextStyleUtils {

  static TextStyle headingStyle() {
    return TextStyle(
        fontSize: getProportionateScreenWidth(28),
        fontWeight: FontWeight.bold,
        color: ColorsUtils.isDarkModeColor(),
        height: 1.5
    );
  }
}
