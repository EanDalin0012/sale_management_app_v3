import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sale_management/shares/utils/colors_utils.dart';


class ToastUtils {
  static showToast({ required String context, required FToast fToast, required int duration}) {
    Widget toast = Container(
      padding: const EdgeInsets.only(left: 5, right: 10, top: 5, bottom: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: ColorsUtils.toastBackgroundContainer(),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const FaIcon(FontAwesomeIcons.checkCircle, size: 25, color: Colors.white),
            const SizedBox(
              width: 12.0,
            ),
            Text(
              context, style: TextStyle(color: ColorsUtils.isDarkModeColor(), fontSize: 17.0),),
          ],
        ),
      ),
    );


    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: duration),
    );

    // // Custom Toast Position
    // fToast.showToast(
    //     child: toast,
    //     toastDuration: Duration(seconds: 2),
    //     positionedToastBuilder: (context, child) {
    //       return Positioned(
    //         child: child,
    //         top: 16.0,
    //         left: 16.0,
    //       );
    //     });
  }

}
