import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sale_management/screens/login/login_screen.dart';
import 'package:sale_management/screens/sign_up/widgets/sign_up_body.dart';
import 'package:sale_management/shares/statics/default.dart';
import 'package:sale_management/shares/utils/colors_utils.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:sale_management/shares/utils/toast_util.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  var loading = false;
  late FToast fToast;

  @override
  void initState() {
    fToast = FToast();
    fToast.init(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => onBackPress(),
      child: Scaffold(
        backgroundColor: ColorsUtils.scaffoldBackgroundColor(),
        appBar: AppBar(
          backgroundColor: ColorsUtils.appBarBackGround(),
          elevation: DefaultStatic.elevationAppBar,
          title: Text('signUp.label.signUp'.tr()),
        ),
        body: SignUpBody(
          onChanged: (val) {
              setState(() {
                loading = val;
              });
          },
        ),
      ),
    );
  }
  Future<bool> onBackPress() {
    if(loading == true) {
      ToastUtils.showToast(context: 'common.label.isLoadingCanNotBack'.tr(), fToast: fToast, duration: 2);
      return Future<bool>.value(false);
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LogInScreen()),
      );
      return Future<bool>.value(true);
    }
  }
}
