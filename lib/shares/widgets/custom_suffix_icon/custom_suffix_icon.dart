import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sale_management/shares/utils/colors_utils.dart';
import 'package:sale_management/shares/utils/size_config_utils.dart';

class CustomSuffixIcon extends StatefulWidget {
  final double? svgPaddingLeft;
  final String svgIcon;
  final VoidCallback? onPress;
  const CustomSuffixIcon({Key? key, required this.svgIcon, this.svgPaddingLeft, this.onPress}) : super(key: key);
  @override
  _CustomSuffixIconState createState() => _CustomSuffixIconState();
}

class _CustomSuffixIconState extends State<CustomSuffixIcon> {
  @override
  Widget build(BuildContext context) {
    double left = 0;
    if (widget.svgPaddingLeft != null) {
      left = widget.svgPaddingLeft!;
    }
    return Padding(
      padding: EdgeInsets.fromLTRB(
        left,
        getProportionateScreenWidth(20),
        getProportionateScreenWidth(20),
        getProportionateScreenWidth(20),
      ),
      child: InkWell(
        onTap: widget.onPress,
        child: SvgPicture.asset(
          widget.svgIcon,
          height: getProportionateScreenWidth(20),
          color: ColorsUtils.svgPictureSufFixIconColor(),
        ),
      ),
    );
  }
}

