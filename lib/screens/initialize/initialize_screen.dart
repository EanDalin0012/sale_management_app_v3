import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sale_management/screens/login/login_screen.dart';
import 'package:sale_management/shares/utils/colors_utils.dart';
import 'package:sale_management/shares/utils/size_config_utils.dart';

class InitializeScreen extends StatefulWidget {
  const InitializeScreen({Key? key}) : super(key: key);
  @override
  _InitializeScreenState createState() => _InitializeScreenState();
}

class _InitializeScreenState extends State<InitializeScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfigUtils.init(context);
    routLogin();
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
                  'assets/images/logo/udemy-logo-0.png',
                  height: 120,
                  width: 200,
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: 20,
                  height: 20,
                  child: const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white70),
                  ),
                )
              ],
            ),
        ),
      ),
    );
  }

  Future<void> routLogin() async {
    await Future.delayed(const Duration(seconds: 5));
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LogInScreen()),
    );
  }
}
