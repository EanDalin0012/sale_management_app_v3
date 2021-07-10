import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WidgetFloatingActionButton extends StatefulWidget {
  final VoidCallback onPressed;
  const WidgetFloatingActionButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  _WidgetFloatingActionButtonState createState() => _WidgetFloatingActionButtonState();
}

class _WidgetFloatingActionButtonState extends State<WidgetFloatingActionButton> {
  var isHovered = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => widget.onPressed(),
      child: Container(
          height: 45,
          width: 45,
          padding: EdgeInsets.all(2),
          decoration: BoxDecoration(
              color: Color(0xff6E747F),
              borderRadius: BorderRadius.circular(50)
          ),
          child: Center(child: FaIcon(FontAwesomeIcons.plusCircle, size: 25, color: Colors.white,))
      ),
    );
  }
}
