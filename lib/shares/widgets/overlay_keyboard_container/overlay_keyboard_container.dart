import 'package:flutter/material.dart';
import 'package:sale_management/shares/utils/colors_utils.dart';

class OverlayKeyboardContainer extends StatelessWidget {
  final String text;
  const OverlayKeyboardContainer({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        color: ColorsUtils.buttonContainer(),
        border: const Border(
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
}
