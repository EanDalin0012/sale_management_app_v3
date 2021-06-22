import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sale_management/screens/choose_language/choose_language_screen.dart';
import 'package:sale_management/screens/login/login_screen.dart';
import 'package:sale_management/shares/database_sqflite/data_base_chose_language.dart';
import 'package:sale_management/shares/database_sqflite/data_base_dark_mode.dart';
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
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white70),
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
