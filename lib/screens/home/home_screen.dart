import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sale_management/shares/statics/default.dart';
import 'package:sale_management/shares/statics/fonts.dart';
import 'package:sale_management/shares/utils/colors_utils.dart';

class HomeScreen extends StatefulWidget {
  final int selectIndex;
  const HomeScreen({Key? key, required this.selectIndex}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  String titleBar = 'home.label.home'.tr();
  var isShowAppBar = true;
  List<Widget> widgetOptions = <Widget>[
    // HomeContainer(),
    // SaleScreen()
  ];

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.selectIndex;
    if(selectedIndex == 1) {
      isShowAppBar = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => onBackPress(),
      child: Scaffold(
        backgroundColor: ColorsUtils.scaffoldBackgroundColor(),
        appBar: isShowAppBar ? _appBar() : null,
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: Text(titleBar),
      backgroundColor: ColorsUtils.appBarBackGround(),
      elevation: DefaultStatic.elevationAppBar,
      leading: Builder(builder: (context) {
        return IconButton(
            icon: const Icon(Icons.sort_rounded),
            onPressed: () => Scaffold.of(context).openDrawer());
      },),
      actions: <Widget>[
        GestureDetector(
          onTap: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => NotificationScreen()),
            // );
          },
          child: Container(
            height: 80,
            width: 55,
            child: Stack(
              children: <Widget>[
                const Center(child: Icon(Icons.notifications)),
                Container(
                  width: 20,
                  height: 20,
                  margin: const EdgeInsets.only(
                      top: 5,
                      left: 30
                  ),
                  decoration: BoxDecoration(
                    color: Colors.purple.withOpacity(0.5),
                    borderRadius: const BorderRadius.all(const Radius.circular(10)),
                  ),
                  child: const Center(child: Text('2', style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w800))),
                ),
              ],
            ),
          ),
        ),
        const Divider(
          height: 5,
          color: Colors.white,
        )
      ],
    );
  }

  Future<bool> onBackPress() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              elevation: 3,
              backgroundColor: const Color(0xff273950),
              title: Center(child: Text('common.label.exitApp'.tr(), style: TextStyle(color: ColorsUtils.isDarkModeColor()),)),
              content: Text('common.label.doYouWantToExitApp'.tr(), style: TextStyle(color: ColorsUtils.isDarkModeColor())),
              actions: <Widget>[
                Container(
                  height: 40,
                  width: 90,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Color(0xff2f3945)),
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
                              color: Colors.red)
                          ),
                        ),
                        const Positioned(
                            left: 0,
                            top: 10.0,
                            child: FaIcon(FontAwesomeIcons.timesCircle, size: 20, color: Colors.red)
                        ),
                      ],
                    ),
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                  ),
                ),

                Container(
                  height: 40,
                  width: 90,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Color(0xff273965)),
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
                        const Positioned(
                            left: 0,
                            top: 10.0,
                            child: FaIcon(FontAwesomeIcons.checkCircle, size: 20, color: Colors.white)
                        ),
                      ],
                    ),
                    onPressed: () {
                      SystemNavigator.pop();
                    },
                  ),
                ),
              ]
          );
        }
    );
    return Future<bool>.value(false);
  }
}
