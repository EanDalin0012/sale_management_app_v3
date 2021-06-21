import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sale_management/screens/login/widgets/login_body.dart';
import 'package:sale_management/shares/utils/colors_utils.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:sale_management/shares/utils/size_config_utils.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);
  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        SystemNavigator.pop();
        return Future<bool>.value(true);
      },
      child: Scaffold(
        backgroundColor: ColorsUtils.scaffoldBackgroundColor(),
        appBar: AppBar(
          backgroundColor: ColorsUtils.appBarBackGround(),
          leading: Container(),
          elevation: 0,
          title: Text('login.label.login'.tr()),
        ),
        body: const SafeArea(
          child: LoginBody()
        ),
      )
    );
  }
}
