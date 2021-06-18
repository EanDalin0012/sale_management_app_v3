import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:sale_management/screens/home/home_screen.dart';
import 'package:sale_management/shares/statics/colors_static.dart';
import 'package:sale_management/shares/statics/fonts.dart';
import 'package:sale_management/shares/utils/input_decoration_utils.dart';
import 'package:sale_management/shares/utils/size_config_utils.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:sale_management/shares/widgets/custom_suffix_icon/custom_suffix_icon.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({Key? key}) : super(key: key);

  @override
  _LoginBodyState createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  final _formKey = GlobalKey<FormState>();
  var emailController = new TextEditingController();
  var passwordController = new TextEditingController();

  bool remember = false;
  var isLoading = false;
  var isClickSave = false;

  var style = InputDecorationUtils.textFormFieldStyle();
  var labelStyle = InputDecorationUtils.inputDecorationLabelStyle();
  var hintStyle = InputDecorationUtils.inputDecorationHintStyle();
  var enabledBorder = InputDecorationUtils.enabledBorder();
  var focusedBorder = InputDecorationUtils.focusedBorder();

  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
      isLoading: isLoading,
      opacity: 0.5,
      progressIndicator: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const CircularProgressIndicator(),
          SizedBox(height: SizeConfigUtils.screenHeight * 0.02),
          const Text('Loading'),
        ],
      ),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: SizeConfigUtils.screenHeight * 0.07),
                    buildEmailFormField(),
                    SizedBox(height: getProportionateScreenHeight(30)),
                    buildPasswordFormField(),
                    SizedBox(height: getProportionateScreenHeight(30)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Checkbox(
                          value: remember,
                          onChanged: (value) {
                            setState(() {
                              remember = value!;
                            });
                          },
                        ),
                        Text('login.label.rememberMe'.tr()),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            'login.label.forgotPassword'.tr(),
                            style: const TextStyle(decoration: TextDecoration
                                .underline),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: SizeConfigUtils.screenHeight * 0.02),
                    _buildLoginButton(),
                    SizedBox(height: SizeConfigUtils.screenHeight * 0.04),
                    noAccount()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );

  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      style: style,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      onChanged: (value) => checkFormValid(),
      validator: (value) {
        if (value!.isEmpty) {
          return 'login.message.pleaseEnterYourEmail'.tr();
        }
        return null;
      },
      decoration: InputDecoration(
          labelText: 'login.label.email'.tr(),
          labelStyle: labelStyle,
          hintText: 'login.holder.enterYourEmail'.tr(),
          hintStyle: hintStyle,
          enabledBorder: enabledBorder,
          focusedBorder: focusedBorder,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: const CustomSuffixIcon(
              svgPaddingLeft: 15,
              svgIcon: "assets/icons/mail_black_24dp.svg"
          )
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      style: style,
      obscureText: true,
      controller: passwordController,
      onChanged: (value) => checkFormValid(),
      validator: (value) {
        if (value!.isEmpty) {
          return 'login.message.pleaseEnterYourPassword'.tr();
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: 'login.label.password'.tr(),
        labelStyle: labelStyle,
        hintText: 'login.holder.enterYourPassword'.tr(),
        hintStyle: hintStyle,
        enabledBorder: enabledBorder,
        focusedBorder: focusedBorder,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: const CustomSuffixIcon(
            svgIcon: "assets/icons/Lock.svg"
        ),
      ),
    );
  }

  Widget _buildLoginButton() {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width - getProportionateScreenWidth(70),
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(const Color(0xff273965)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)
                )
            )
        ),
        child: Stack(
          children: <Widget>[
            Center(child: Text('login.label.login'.tr(), style: TextStyle(
                fontFamily: fontDefault,
                fontWeight: FontWeight.w500,
                fontSize: 20,
                color: Colors.white),)
            ),
            const Positioned(
                right: 0,
                top: 12.5,
                child: FaIcon(FontAwesomeIcons.signOutAlt, size: 25, color: Colors.white)
            ),
          ],
        ),
        onPressed: () => logIn()
      ),
    );
  }

  Row noAccount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'login.label.dontHaveAnAccount'.tr(),
          style: TextStyle(fontSize: getProportionateScreenWidth(16)),
        ),
        GestureDetector(
          // onTap: () => onTabToSignUp(context),
          onTap: () {

          },
          child: Text(
            'login.label.signUp'.tr(),
            style: TextStyle(
                fontSize: getProportionateScreenWidth(16),
                color: kPrimaryColor),
          ),
        ),
      ],
    );
  }

  void checkFormValid() {
    if (isClickSave) {
      _formKey.currentState!.validate();
    }
  }

  void logIn() {
    isClickSave = true;
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });

      rout();
    }
  }

  Future<void> rout() async {

    await Future.delayed(const Duration(seconds: 3));

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>
      const HomeScreen(selectIndex: 0)
      ),
    );
  }

}
