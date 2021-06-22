import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sale_management/screens/forgot_password/widgets/forgot_password_body.dart';
import 'package:sale_management/shares/statics/default.dart';
import 'package:sale_management/shares/utils/colors_utils.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:sale_management/shares/utils/toast_util.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
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
        body: ForgotPasswordBody(
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
    }
    return Future<bool>.value(false);
  }

}
