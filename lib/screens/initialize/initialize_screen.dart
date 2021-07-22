import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sale_management/screens/choose_language/choose_language_screen.dart';
import 'package:sale_management/screens/login/login_screen.dart';
import 'package:sale_management/shares/database_sqflite/authorization_sqflite.dart';
import 'package:sale_management/shares/database_sqflite/data_base_chose_language.dart';
import 'package:sale_management/shares/database_sqflite/data_base_dark_mode.dart';
import 'package:sale_management/shares/model/key/authorization_key.dart';
import 'package:sale_management/shares/model/key/dark_mode_key.dart';
import 'package:sale_management/shares/statics/dark_mode.dart';
import 'package:sale_management/shares/utils/colors_utils.dart';
import 'package:sale_management/shares/utils/size_config_utils.dart';

class InitializeScreen extends StatefulWidget {
  const InitializeScreen({Key? key}) : super(key: key);
  @override
  _InitializeScreenState createState() => _InitializeScreenState();
}

class _InitializeScreenState extends State<InitializeScreen> {
  
  var chose = false;

  @override
  Widget build(BuildContext context) {
    SizeConfigUtils.init(context);
    return WillPopScope(
      onWillPop: () {
        SystemNavigator.pop();
        return Future<bool>.value(true);
      },
      child: Scaffold(
          backgroundColor: ColorsUtils.scaffoldBackgroundColor(),
          body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logo/udemy-1-logo-png-transparent-768x630.png',
                    height: 120,
                    width: 200,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text('Welcome'),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text('Sale Management System', style: TextStyle(fontSize: 25)),
                ],
              ),
          ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    AuthorizationDataBase.getObjectById(1).then((value) {

      String formattedString = value[AuthorizationKey.dateTime];
      var stringArr = formattedString.split(' ');
      var dateString = stringArr[0];
      var dateStringArr =dateString.split('-');

      String years = dateStringArr[2].toString();
      String month = dateStringArr[1].toString();
      String day = dateStringArr[0].toString();
      String dateCombind = years.toString() + '-' +month.toString()+'-'+day.toString();

      String myDate =dateCombind + ' '+stringArr[1];

      print('myDate 0:'+myDate);

      DateTime now = DateTime.now();
      // String formattedDate = DateFormat('yyyy-MM-dd hh:mm:ss').format(now);
      // DateTime now1 = DateTime.parse(formattedDate);
      
      // print('formattedDate:'+formattedDate);
      // print('date.hour.toString():'+now1.hour.toString());

      DateTime date1 = DateTime.parse('2021-07-19 14:32:00.000');
      print(now.toString());
      print(date1.toString());
      //
      if(now.compareTo(date1) == true) {
        print('compareTo:');
      }
      if(now.isAfter(date1)) {
        print('isAfter:');
      }
      if(now.isBefore(date1)) {
        print('isBefore:');
      }

    });

    DataBaseDarkModeUtils.getDarkModeById(1).then((value) {
      if (value.toString() == '{}') {
        Map json = {
          DarkModeKey.id: 1,
          DarkModeKey.code: '1' // 1=> true, 0=> false
        };
        DataBaseDarkModeUtils.create(json).then((value) {
          if (value > 0) {
            DarkMode.isDarkMode = false;
          }
        });
      } else {
        setState(() {
          Map data = value;
          if (data[DarkModeKey.code].toString() == '1') {
            DarkMode.isDarkMode = true;
          } else {
            DarkMode.isDarkMode = false;
          }
        });
      }
    });

    DataBaseChoseLanguage.getChooseLanguageById(1).then((value) {
      setState(() {
        if (value.toString() == '{}') {
          chose = false;
        } else {
          chose = true;
        }
      });
    });
    Timer(
      const Duration(seconds: 5), () {
      if(chose == true) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LogInScreen()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const ChooseLanguageScreen()),
        );
      }

    });
  }

}
