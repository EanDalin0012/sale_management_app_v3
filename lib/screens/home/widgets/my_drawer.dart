import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sale_management/screens/login/login_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:sale_management/shares/statics/fonts.dart';
import 'package:sale_management/shares/utils/colors_utils.dart';

class MyDrawer extends StatelessWidget {
  MyDrawer({Key? key}) : super(key: key);
  var size;

  var style;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery
        .of(context)
        .size;
    style = TextStyle(fontFamily: fontDefault,
        fontWeight: FontWeight.w500,
        color: ColorsUtils.isDarkModeColor());
    return Drawer(
        child: Scaffold(
            backgroundColor: ColorsUtils.scaffoldBackgroundColor(),
            body: Stack(
                children: <Widget>[
                  SingleChildScrollView(
                    child: Container(
                      height: size.height,
                      width: size.width,
                      child: Column(
                        children: <Widget>[
                          Container(
                              padding: EdgeInsets.only(
                                  top: 15, left: 8, right: 8, bottom: 15),
                              color: Color(0xff273965),
                              child: Row(
                                children: <Widget>[
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(100.0),
                                    child: Image.asset(
                                      "assets/images/profile.jpg", width: 80,
                                      height: 80,
                                      fit: BoxFit.fill,),
                                  ),
                                  SizedBox(width: 15,),
                                  RichText(
                                      text: TextSpan(
                                          children: [
                                            TextSpan(text: "Name Surname\n",
                                                style: TextStyle(
                                                    fontWeight: FontWeight
                                                        .bold)),
                                            TextSpan(text: "@username"),
                                          ]
                                      )
                                  )
                                ],
                              )
                          ),
                          ListTile(
                              onTap: () => _callNumber(),
                              title: Text(
                                'drawer.label.contactUs'.tr(), style: style,),
                              leading: FaIcon(FontAwesomeIcons.mobile, size: 20, color: Colors.white)),
                          ListTile(title: Text(
                              'drawer.label.termsCondition'.tr(), style: style),
                            leading: Icon(Icons.list_alt,
                                color: ColorsUtils.iConColor()),),
                          Divider(
                            color: ColorsUtils.isDarkModeColor(),
                          ),
                          ListTile(
                            onTap: () {
                              Navigator.pop(context);
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(builder: (context) =>
                              //       SettingScreen()),
                              // );
                            },
                            title: Text('drawer.label.settings'.tr(),
                              style: TextStyle(
                                  color: ColorsUtils.isDarkModeColor()),),
                            leading: FaIcon(FontAwesomeIcons.cog, size: 20, color: Colors.white),
                          ),
                          Column(
                            children: <Widget>[
                              ListTile(
                                title: new Text(
                                  'drawer.label.logout'.tr(),
                                  style: new TextStyle(
                                    color: ColorsUtils.isDarkModeColor(),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                trailing: FaIcon(FontAwesomeIcons.signOutAlt, size: 20, color: Colors.white),
                                onTap: () {
                                  Navigator.pop(context);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LogInScreen()),
                                  );
                                },
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).padding.bottom,
                              )
                            ],
                          ),
                          Divider(
                            color: ColorsUtils.isDarkModeColor(),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Positioned(
                      bottom: 0,
                      child: Container(
                        width: size.width,
                        padding: const EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 60.0,),
                        color: Color(0xff273955),
                        child: Text("2.20.00", style: TextStyle(fontWeight: FontWeight.w900),),
                      )
                  ),

                ]
            )
        )
    );
  }

  _callNumber() async {
    const number = '0966555879'; //set the number here
    bool? res = await FlutterPhoneDirectCaller.callNumber(number);
  }

}
