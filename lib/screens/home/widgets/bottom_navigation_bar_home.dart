import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:sale_management/shares/statics/colors_static.dart';

class BottomNavigationBarHome extends StatelessWidget {
   final int selectedIndex;
   final ValueChanged<int> onTab;
   BottomNavigationBarHome({Key? key, required this.selectedIndex, required this.onTab}) : super(key: key);
   Color activeColor = Colors.white;
   double activeIconSize = 25;
  @override
  Widget build(BuildContext context) {

    return BottomNavigationBar(
      currentIndex: selectedIndex,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      backgroundColor: Color(0xff273965),
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            FeatherIcons.home,
            color: kGoodLightGray,
          ),
          title: Text('HOME'),
          activeIcon: Icon(
            FeatherIcons.home,
            color: activeColor,
            size: activeIconSize,
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            FeatherIcons.plusCircle,
            color: kGoodLightGray,
          ),
          title: Text('CALENDAR'),
          activeIcon: Icon(
            FeatherIcons.plusCircle,
            color: activeColor,
            size: activeIconSize,
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            FeatherIcons.alignLeft,
            color: kGoodLightGray,
          ),
          title: Text('PROFILE'),
          activeIcon: Icon(
            FeatherIcons.alignLeft,
            color: activeColor,
            size: activeIconSize,
          ),
        ),
      ],
      onTap: onTab
    );
  }
}
