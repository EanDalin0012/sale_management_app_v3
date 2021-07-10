import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WidgetAppBarAction extends StatefulWidget {
  final ValueChanged<bool> onChanged;
  final bool isNative;
  const WidgetAppBarAction({Key? key, required this.onChanged, required this.isNative}) : super(key: key);

  @override
  _WidgetAppBarActionState createState() => _WidgetAppBarActionState();
}

class _WidgetAppBarActionState extends State<WidgetAppBarAction> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: widget.isNative ?  _searchButton() : _crossButton() ,
        onPressed: () => widget.onChanged(!widget.isNative)
    );
  }

  Widget _crossButton() {
    return FaIcon(FontAwesomeIcons.search, color: Colors.white, size: 18);
  }

  Widget _searchButton() {
    return FaIcon(FontAwesomeIcons.timesCircle, color: Colors.white, size: 18);
  }

}
