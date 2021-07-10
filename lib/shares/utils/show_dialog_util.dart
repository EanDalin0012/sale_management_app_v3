import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sale_management/shares/statics/fonts.dart';

class ShowDialogUtil {

  static void showDialogYesNo({
    required BuildContext buildContext,
    Widget? title,
    required Widget content,
    double? elevation,
    required VoidCallback onPressedYes,
    required VoidCallback onPressedNo,
  }) {
    showDialog(context: buildContext,
        builder: (BuildContext context) {
          return AlertDialog(
              elevation: 3,
              backgroundColor: Color(0xff273950),
              title: Center(child: title),
              content: content,
              actions: <Widget>[
                Container(
                  height: 40,
                  width: 90,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        // backgroundColor: MaterialStateProperty.all<Color>(Color(0xff2f3945)),
                        backgroundColor: MaterialStateProperty.all<Color>(Color(0xff273955)),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)
                            )
                        )
                    ),
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          right: 0,
                          top: 10.0,
                          child: Text('common.label.no'.tr(), style: TextStyle(
                              fontFamily: fontDefault,
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: Colors.white)
                          ),
                        ),
                        Positioned(
                            left: 0,
                            top: 10.0,
                            child: FaIcon(FontAwesomeIcons.timesCircle, size: 20, color:Colors.white)
                        ),
                      ],
                    ),
                    onPressed: () {
                      Navigator.of(context).pop(false);
                      onPressedNo();
                    },
                  ),
                ),

                Container(
                  height: 40,
                  width: 90,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Color(0xff273955)),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)
                            )
                        )
                    ),
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          right: 0,
                          top: 10.0,
                          child: Text('common.label.yes'.tr(), style: TextStyle(
                              fontFamily: fontDefault,
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: Colors.white)
                          ),
                        ),
                        Positioned(
                            left: 0,
                            top: 10.0,
                            child: FaIcon(FontAwesomeIcons.checkCircle, size: 20, color: Colors.white)
                        ),
                      ],
                    ),
                    onPressed: () {
                      Navigator.of(context).pop(false);
                      onPressedYes();
                    },
                  ),
                ),
              ]
          );
        });
  }

  static void dialog({
    required BuildContext buildContext,
    Widget? title,
    required Widget content,
    double? elevation,
  }) {
    showDialog(
        context: buildContext,
        builder: (BuildContext context) {
          return AlertDialog(
              elevation: 5,
              backgroundColor: Color(0xff273950),
              title: Center(child: title),
              content: SingleChildScrollView(
                  child: content
              ),
              actions: <Widget>[
                RaisedButton.icon(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  label: Text('common.label.ok'.tr(),
                    style: TextStyle(color: Colors.white,fontSize: 18),),
                  icon: Icon(
                    Icons.check_circle_outline_outlined, color: Colors.white,),
                  textColor: Colors.white,
                  splashColor: Color(0xff273950),
                  color: Color(0xff273950),
                ),
              ]
          );
        });
  }

  static Widget _buildIconCheck() {
    return Container(
      width: 30,
      height: 30,
      child: Image(
          image: AssetImage('assets/icons/success-green-check-mark.png')),
    );
  }

}
