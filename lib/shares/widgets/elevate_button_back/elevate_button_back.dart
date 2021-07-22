import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sale_management/shares/statics/fonts.dart';
import 'package:easy_localization/easy_localization.dart';

class ElevatedButtonBack extends StatefulWidget {
  final VoidCallback onPressed;
  const ElevatedButtonBack({Key? key, required this.onPressed}) : super(key: key);
  @override
  _ElevatedButtonBackState createState() => _ElevatedButtonBackState();
}

class _ElevatedButtonBackState extends State<ElevatedButtonBack> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(const Color(0xff273965)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                          bottomLeft: Radius.circular(15),
                         bottomRight: Radius.circular(15),
                      )
                  )
              )
          ),
          onPressed: ()=> widget.onPressed(),
          child: Stack(
              children: <Widget>[
                Center(child: Text('common.label.back'.tr(), style: TextStyle(
                    fontFamily: fontDefault,
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: Colors.white),)
                ),
                const Positioned(
                    left: 0,
                    top: 12.5,
                    child: FaIcon(FontAwesomeIcons.arrowCircleLeft, size: 25, color: Colors.white)
                ),
              ]
          )
      ),
    );
  }
}
