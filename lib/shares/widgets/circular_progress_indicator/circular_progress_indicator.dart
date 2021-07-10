import 'package:flutter/material.dart';
import 'package:sale_management/shares/utils/colors_utils.dart';

class CircularProgressLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            "Loading Data",
            style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: ColorsUtils.isDarkModeColor()
            ),
          ),
          SizedBox(height: 20),
          CircularProgressIndicator()
        ],
      ),
    );
  }
}
