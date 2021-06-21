import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:sale_management/screens/home/home_screen.dart';
import 'package:sale_management/shares/database_sqflite/authorization_sqflite.dart';
import 'package:sale_management/shares/model/key/authorization_key.dart';
import 'package:sale_management/shares/statics/authorization_static.dart';
import 'package:sale_management/shares/statics/colors_static.dart';
import 'package:sale_management/shares/statics/fonts.dart';
import 'package:sale_management/shares/utils/input_decoration_utils.dart';
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
  var emailController = new TextEditingController();
  var passwordController = new TextEditingController();
  String email = '';
  String password ='';

  final FocusNode _focusNode = FocusNode();
  bool _isComposing = false;

  bool remember = false;
  var isLoading = false;
  var isClickSave = false;

  var style;
  var labelStyle;
  var hintStyle;
  var enabledBorder;
  var focusedBorder;

  @override
  Widget build(BuildContext context) {
     style = InputDecorationUtils.textFormFieldStyle();
     labelStyle = InputDecorationUtils.inputDecorationLabelStyle();
     hintStyle = InputDecorationUtils.inputDecorationHintStyle();
     enabledBorder = InputDecorationUtils.enabledBorder();
     focusedBorder = InputDecorationUtils.focusedBorder();
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
      focusNode: _focusNode,
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
        onPressed: logIn
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
      _formKey.currentState!.validate() ;
    }
  }

  void logIn() {
    isClickSave = true;
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
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>
              const HomeScreen(selectIndex: 0)
              ),
            );
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
    var url = Uri.parse('http://192.168.43.44:8080/oauth/token');
    var response = await http.post(
        url,
        body: {
          'client_id': 'spring-security-oauth2-read-write-client',
          'grant_type': 'password',
          'username':'admin@gmail.com',
          'password':'admin1234'
        },
        headers: {
          HttpHeaders.authorizationHeader: basicAuth,
        },
        );

    if(response.body != '') {
      Map<String, dynamic> tokenResponse = jsonDecode(response.body);
      AuthorizationStatic.tokenObject = tokenResponse;
      return Future.value(tokenResponse);
    }
    return Future.value({});
  }

}
