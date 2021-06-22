import 'package:flutter/material.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:sale_management/shares/utils/input_decoration_utils.dart';
import 'package:sale_management/shares/utils/keyboard_util.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:sale_management/shares/utils/size_config_utils.dart';
import 'package:sale_management/shares/utils/text_style_util.dart';
import 'package:sale_management/shares/utils/validate_utils.dart';
import 'package:sale_management/shares/widgets/custom_suffix_icon/custom_suffix_icon.dart';
import 'package:sale_management/shares/widgets/gender_option/gender_optional.dart';
import 'package:sale_management/shares/widgets/overlay_keyboard_container/overlay_keyboard_container.dart';

class SignUpBody extends StatefulWidget {
  final ValueChanged<bool> onChanged;
  const SignUpBody({Key? key, required this.onChanged}) : super(key: key);
  @override
  _SignUpBodyState createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {

  var emailController =  TextEditingController();
  var firstNameController =  TextEditingController();
  var lastNameController =  TextEditingController();
  var passwordController =  TextEditingController();
  var confPasswordController =  TextEditingController();
  var gender;
  late String email;
  late String password;
  bool remember = false;
  bool isClickSave = false;
  final _formKey = GlobalKey<FormState>();
  late Size size;

  var style = InputDecorationUtils.textFormFieldStyle();
  var labelStyle = InputDecorationUtils.inputDecorationLabelStyle();
  var hintStyle = InputDecorationUtils.inputDecorationHintStyle();
  var enabledBorder = InputDecorationUtils.enabledBorder();
  var   focusedBorder = InputDecorationUtils.focusedBorder();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return LoadingOverlay(
      isLoading: isLoading,
      opacity: 0.5,
      progressIndicator: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.redAccent),
          ),
          SizedBox(height: SizeConfigUtils.screenHeight * 0.03),
          const Text('Loading', style: TextStyle(color: Colors.red, fontSize: 18),),
        ],
      ),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            _buildBody(),
            InkWell(
                onTap: () {
                  KeyboardUtil.hideKeyboard(context);
                  save();
                },
                child: OverlayKeyboardContainer(
                    text: 'signUp.label.create'.tr())
            )
          ],
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            children: <Widget>[
              SizedBox(height: SizeConfigUtils.screenHeight * 0.04),
              Center(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: SizeConfigUtils.screenHeight * 0.03), // 4%
                    Text('signUp.label.createAccount'.tr(),
                        style: TextStyleUtils.headingStyle()),
                    Text(
                      'signUp.label.completeDetails'.tr(),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              SizedBox(height: SizeConfigUtils.screenHeight * 0.04),
              _buildFirstNameField(),
              SizedBox(height: SizeConfigUtils.screenHeight * 0.02),
              _buildLastNameField(),
              SizedBox(height: SizeConfigUtils.screenHeight * 0.02),
              GenderForm(
                  size: size,
                  initialValue: gender,
                  onChanged: (value) {
                    checkFormValid();
                    setState(() {
                      gender = value;
                    });
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'Please select gender!';
                    }
                    return null;
                  }
              ),
              SizedBox(height: SizeConfigUtils.screenHeight * 0.02),
              buildEmailFormField(),
              SizedBox(height: SizeConfigUtils.screenHeight * 0.02),
              _buildPasswordField(),
              SizedBox(height: SizeConfigUtils.screenHeight * 0.02),
              _buildConfPasswordField(),
              SizedBox(height: SizeConfigUtils.screenHeight * 0.04),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField _buildFirstNameField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      controller: firstNameController,
      onChanged: (value) => checkFormValid(),
      validator: (value) {
        if (value!.isEmpty) {
          return 'signUp.message.pleaseEnterFirstName'.tr();
        }
        return null;
      },
      style: style,
      decoration: InputDecoration(
        labelText: 'signUp.label.firstName'.tr(),
        labelStyle: labelStyle,
        hintText: 'signUp.holder.enterYourFistName'.tr(),
        hintStyle: hintStyle,
        enabledBorder: enabledBorder,
        focusedBorder: focusedBorder,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: const CustomSuffixIcon(svgPaddingLeft: 15,
            svgIcon: "assets/icons/help_outline_black_24dp.svg"),
      ),
    );
  }

  TextFormField _buildLastNameField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      controller: lastNameController,
      onChanged: (value) => checkFormValid(),
      validator: (value) {
        if (value!.isEmpty) {
          return 'signUp.message.pleaseEnterLastName'.tr();
        }
        return null;
      },
      style: style,
      decoration: InputDecoration(
        labelText: 'signUp.label.lastName'.tr(),
        labelStyle: labelStyle,
        hintText: 'signUp.holder.enterYourLastName'.tr(),
        hintStyle: hintStyle,
        enabledBorder: enabledBorder,
        focusedBorder: focusedBorder,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: const CustomSuffixIcon(svgPaddingLeft: 15,
            svgIcon: "assets/icons/help_outline_black_24dp.svg"),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onChanged: (value) => checkFormValid(),
      validator: (value) {
        if (value!.isEmpty) {
          return 'signUp.message.pleaseEnterEmail'.tr();
        } else if(!ValidateUtils.validatorEmail(email: value)) {
          return 'login.message.enterValidEmail'.tr();
        }
        return null;
      },
      style: style,
      decoration: InputDecoration(
        labelText: 'signUp.label.email'.tr(),
        labelStyle: labelStyle,
        hintText: 'signUp.holder.enterYourEmail'.tr(),
        hintStyle: hintStyle,
        enabledBorder: enabledBorder,
        focusedBorder: focusedBorder,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: const CustomSuffixIcon(svgPaddingLeft: 15,
            svgIcon: "assets/icons/mark_as_unread_black_24dp.svg"),
      ),
    );
  }

  TextFormField _buildPasswordField() {
    return TextFormField(
      textInputAction: TextInputAction.next,
      controller: passwordController,
      onChanged: (value) => checkFormValid(),
      validator: (value) {
        if (value!.isEmpty) {
          return 'signUp.message.pleaseEnterPassword'.tr();
        }
        return null;
      },
      style: style,
      decoration: InputDecoration(
        labelText: 'signUp.label.password'.tr(),
        labelStyle: labelStyle,
        hintText: 'signUp.holder.enterYourPassword'.tr(),
        hintStyle: hintStyle,
        enabledBorder: enabledBorder,
        focusedBorder: focusedBorder,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: const CustomSuffixIcon(svgPaddingLeft: 15,
            svgIcon: "assets/icons/help_outline_black_24dp.svg"),
      ),
    );
  }

  TextFormField _buildConfPasswordField() {
    return TextFormField(
      textInputAction: TextInputAction.next,
      controller: confPasswordController,
      onChanged: (value) => checkFormValid(),
      validator: (value) {
        if (value!.isEmpty) {
          return 'signUp.message.pleaseEnterConfirmPassword'.tr();
        }
        return null;
      },
      style: style,
      decoration: InputDecoration(
        labelText: 'signUp.label.confirmPassword'.tr(),
        labelStyle: labelStyle,
        hintText: 'signUp.holder.enterConfirmPassword'.tr(),
        hintStyle: hintStyle,
        enabledBorder: enabledBorder,
        focusedBorder: focusedBorder,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: const CustomSuffixIcon(svgPaddingLeft: 15,
            svgIcon: "assets/icons/help_outline_black_24dp.svg"),
      ),
    );
  }

  void checkFormValid() {
    if (isClickSave) {
      _formKey.currentState!.validate();
    }
  }

  void save() {
    isClickSave = true;
    if (_formKey.currentState!.validate()) {
      widget.onChanged(true);
      setState(() {
        isLoading = true;
      });

    }
  }

}
