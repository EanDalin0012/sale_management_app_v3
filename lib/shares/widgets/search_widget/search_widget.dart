import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sale_management/shares/utils/input_decoration_utils.dart';

class SearchWidget extends StatefulWidget {
  final String text;
  final String hintText;
  final ValueChanged<String> onChanged;


  SearchWidget({Key? key, required this.text, required this.hintText, required this.onChanged}): super(key: key);

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  var style;

  var labelStyle;

  var hintStyle;

  var enabledBorder;

  var focusedBorder;

  @override
  Widget build(BuildContext context) {
    style = InputDecorationUtils.textFormFieldStyle();
    labelStyle = InputDecorationUtils.inputDecorationLabelStyle();
    hintStyle = InputDecorationUtils.inputDecorationHintStyle();
    enabledBorder = InputDecorationUtils.enabledBorder();
    focusedBorder = InputDecorationUtils.focusedBorder();

    return TextFormField(
        keyboardType: TextInputType.text,
        style: this.style,
        decoration: InputDecoration(
            labelStyle: this.labelStyle,
            hintText: widget.hintText,
            hintStyle: this.hintStyle,
            contentPadding: EdgeInsets.only(left: 25, right: 15),
            fillColor: Colors.white,
            focusedBorder: this.focusedBorder,
            enabledBorder: this.enabledBorder,
            prefixIconConstraints: BoxConstraints(
              minWidth: 45,
            ),
            prefixIcon: Padding(
                padding: EdgeInsets.only(left: 15),
                child: FaIcon(FontAwesomeIcons.search, color: Colors.white, size: 18)
            )
        ),
        onChanged: (value) {
          this.widget.onChanged(value);
        }
    );
  }
}
