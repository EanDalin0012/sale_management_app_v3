import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IconCheck extends StatefulWidget {
  const IconCheck({Key? key}) : super(key: key);

  @override
  _IconCheckState createState() => _IconCheckState();
}

class _IconCheckState extends State<IconCheck> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 25,
        width: 25,
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
            color: const Color(0xff6E747F),
            borderRadius: BorderRadius.circular(50)
        ),
        child: const Center(child: FaIcon(FontAwesomeIcons.checkDouble, size: 15, color: Colors.white,))
    );
  }
}
