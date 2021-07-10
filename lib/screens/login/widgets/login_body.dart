import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:sale_management/screens/forgot_password/forgot_password_screen.dart';
import 'package:sale_management/screens/home/home_screen.dart';
import 'package:sale_management/screens/sign_up/sign_up_screen.dart';
import 'package:sale_management/shares/database_sqflite/authorization_sqflite.dart';
import 'package:sale_management/shares/environment/environment.dart';
import 'package:sale_management/shares/model/key/authorization_key.dart';
import 'package:sale_management/shares/service/authorization_service.dart';
import 'package:sale_management/shares/statics/authorization_static.dart';
import 'package:sale_management/shares/statics/colors_static.dart';
import 'package:sale_management/shares/statics/fonts.dart';
import 'package:sale_management/shares/utils/input_decoration_utils.dart';
import 'package:sale_management/shares/utils/keyboard_util.dart';
import 'package:sale_management/shares/utils/size_config_utils.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:sale_management/shares/utils/validate_utils.dart';
import 'package:sale_management/shares/widgets/custom_suffix_icon/custom_suffix_icon.dart';
import 'package:http/http.dart' as http;

class LoginBody extends StatefulWidget {
  const LoginBody({Key? key}) : super(key: key);

  @override
  _LoginBodyState createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  final _formKey = GlobalKey<FormState>();
  var emailController =  TextEditingController();
  var passwordController =  TextEditingController();

  bool remember = false;
  var isLoading = false;
  var isClickSave = false;

  var style = InputDecorationUtils.textFormFieldStyle();
  var labelStyle = InputDecorationUtils.inputDecorationLabelStyle();
  var hintStyle = InputDecorationUtils.inputDecorationHintStyle();
  var enabledBorder = InputDecorationUtils.enabledBorder();
  var focusedBorder = InputDecorationUtils.focusedBorder();
  bool _obscureText = true;
  var passSvg = 'visibility_off_black_24dp.svg';

  @override
  void initState() {
    super.initState();
    emailController.text = 'admin@gmail.com';
    passwordController.text ='admin123';
  }

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
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>
                              const ForgotPasswordScreen()
                              ),
                            );

                          },
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
      keyboardType: TextInputType.emailAddress,
      controller: emailController,
      onChanged: (value) => checkFormValid(),
      validator: (value) {
        if (value!.isEmpty) {
          return 'login.message.pleaseEnterYourEmail'.tr();
        } else if(!ValidateUtils.validatorEmail(email: value)) {
          return 'login.message.enterValidEmail'.tr();
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
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      obscureText: _obscureText,
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
        suffixIcon: CustomSuffixIcon(
            onPress: () {
              setState(() {
                _obscureText = !_obscureText;
                passSvg = _obscureText ? 'visibility_off_black_24dp.svg' : 'visibility_black_24dp.svg';
              });
            },
            svgIcon: "assets/icons/"+passSvg,
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
           elevation: MaterialStateProperty.all(2.0),
            backgroundColor: MaterialStateProperty.all<Color>(const Color(0xff273965)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)
                ),
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
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            Map<String, dynamic> data = await AuthorizationService.authorization(userName: emailController.text, password: passwordController.text);
            print('token login screen value: '+data.toString());
            if(data.toString() != '{}') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>
                const HomeScreen(selectIndex: 0)
                ),
              );
            }
          }
        }
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
        InkWell(
          // onTap: () => onTabToSignUp(context),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>
              const SignUpScreen()
              ),
            );

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
      _formKey.currentState!.validate() ;
    }
  }

  void logIn() {
    isClickSave = true;
    KeyboardUtil.hideKeyboard(context);
    if (_formKey.currentState!.validate()) {
      makePostRequest("").then((value) {
        Map<String , dynamic> json = {
          AuthorizationKey.id: 1,
          AuthorizationKey.accessToken: value['access_token'],
          AuthorizationKey.refreshToken: value['refresh_token'],
          AuthorizationKey.tokenType: value['token_type'],
          AuthorizationKey.scope: value['scope'],
          AuthorizationKey.expiresIn: value['expires_in'],
        };
        AuthorizationDataBase.create(json).then((value) {
          if(value > 0) {

          }
        });

      });
    }
  }

  Future<void> rout() async {
    makePostRequest("");
    //
    // await Future.delayed(const Duration(seconds: 3));
    //
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) =>
    //   const HomeScreen(selectIndex: 0)
    //   ),
    // );
  }

  Future<Map<String, dynamic>> makePostRequest(String urlPrefix) async {

    String userName = 'spring-security-oauth2-read-write-client';
    String password = 'spring-security-oauth2-read-write-client-password1234';

    String basicAuth = 'Basic '+base64Encode(utf8.encode('$userName:$password'));
    String uri = Environment.url + "/oauth/token";
    var url = Uri.parse(uri);
    var response = await http.post(
        url,
        body: {
          'client_id': 'spring-security-oauth2-read-write-client',
          'grant_type': 'password',
          'username':emailController.text,
          'password': passwordController.text
        },
        headers: {
          HttpHeaders.authorizationHeader: basicAuth,
        },
        );

    if(response.body != '') {
      Map<String, dynamic> tokenResponse = jsonDecode(response.body);
      AuthorizationStatic.tokenObject = tokenResponse;
      print(tokenResponse);
      return Future.value(tokenResponse);
    }
    return Future.value({});
  }

}
