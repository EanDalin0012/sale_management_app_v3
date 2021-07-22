import 'package:flutter/material.dart';
import 'package:sale_management/screens/category/success_category_screen.dart';
import 'package:sale_management/shares/model/key/category_key.dart';
import 'package:sale_management/shares/service/http_service.dart';
import 'package:sale_management/shares/utils/colors_utils.dart';
import 'package:sale_management/shares/utils/input_decoration_utils.dart';
import 'package:sale_management/shares/utils/keyboard_util.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:sale_management/shares/utils/size_config_utils.dart';
import 'package:sale_management/shares/utils/text_style_util.dart';
import 'package:sale_management/shares/utils/widgets_util.dart';
import 'package:sale_management/shares/widgets/custom_suffix_icon/custom_suffix_icon.dart';

class AddBewCategoryBody extends StatefulWidget {
  final ValueChanged<bool> onChanged;
  const AddBewCategoryBody({Key? key, required this.onChanged}) : super(key: key);

  @override
  _AddBewCategoryBodyState createState() => _AddBewCategoryBodyState();
}

class _AddBewCategoryBodyState extends State<AddBewCategoryBody> {

  final _formKey = GlobalKey<FormState>();
  var isClickSave = false;
  var nameController = new TextEditingController();
  var remarkController = new TextEditingController();
  var style;
  var labelStyle;
  var hintStyle;
  var enabledBorder;
  var focusedBorder;
  bool _isLoading = false;
  var isSave = false;

  @override
  Widget build(BuildContext context) {
    style = InputDecorationUtils.textFormFieldStyle();
    labelStyle = InputDecorationUtils.inputDecorationLabelStyle();
    hintStyle = InputDecorationUtils.inputDecorationHintStyle();
    enabledBorder = InputDecorationUtils.enabledBorder();
    focusedBorder = InputDecorationUtils.focusedBorder();
    return Form(
          key: _formKey,
          child: Column(
              children: <Widget>[
                _buildBody(),
                InkWell(
                    onTap: () {
                      KeyboardUtil.hideKeyboard(context);
                      if(_isLoading == false) {
                        save();
                      }
                      setState(() {
                        _isLoading = true;
                      });

                    },
                    child: WidgetsUtil.overlayKeyBardContainer(text: 'common.label.save'.tr(), isLoading: _isLoading)
                )
              ]
          )
    );
  }

  Widget _buildBody() {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Column(
            children: <Widget>[
              Center(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: SizeConfigUtils.screenHeight * 0.04), // 4%
                    Text('category.label.registerCategory'.tr(),
                        style: TextStyleUtils.headingStyle()),
                    Text(
                      'common.label.completeYourDetails'.tr(),
                      textAlign: TextAlign.center,
                      style: TextStyle(color: ColorsUtils.isDarkModeColor()),
                    ),
                  ],
                ),
              ),
              SizedBox(height: SizeConfigUtils.screenHeight * 0.04),
              _buildNameField(),
              SizedBox(height: SizeConfigUtils.screenHeight * 0.02),
              _buildRemarkField(),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField _buildNameField() {
    return TextFormField(
      style: style,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      controller: nameController,
      onChanged: (value) => checkFormValid(),
      validator: (value) {
        if (value!.isEmpty) {
          return 'category.message.pleaseEnterCategoryName'.tr();
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: 'category.label.name'.tr(),
        labelStyle: labelStyle,
        hintText: 'category.holder.enterCategoryName'.tr(),
        hintStyle: hintStyle,
        enabledBorder: enabledBorder,
        focusedBorder: this.focusedBorder,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgPaddingLeft: 15,
            svgIcon: "assets/icons/help_outline_black_24dp.svg"),
      ),
    );
  }

  TextFormField _buildRemarkField() {
    return TextFormField(
      style: style,
      keyboardType: TextInputType.text,
      controller: remarkController,
      decoration: InputDecoration(
        labelText: 'common.label.remark'.tr(),
        labelStyle: labelStyle,
        hintText: 'common.holder.enterRemark'.tr(),
        hintStyle: hintStyle,
        enabledBorder: enabledBorder,
        focusedBorder: this.focusedBorder,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgPaddingLeft: 15,
            svgIcon: "assets/icons/border_color_black_24dp.svg"),
      ),
    );
  }

  Widget loading() {
    return Container();
  }

  void save() {
    this.isClickSave = true;
    if (_formKey.currentState!.validate()) {
      widget.onChanged(true);
      Map<String ,dynamic> json = {
        CategoryKey.name: nameController.text,
        CategoryKey.remark: remarkController.text
      };
      HttpService.httpPost(endPoint: "/api/mob/v0/category/save", json: json).then((value) {
        if(value.toString() != '{}') {
          rout(value[CategoryKey.id]);
        }

      });
      //
    }
  }

  void checkFormValid() {
    if (isClickSave) {
      _formKey.currentState!.validate();
    }
  }

  Future<void> rout(int id) async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>
          SuccessCategoryScreen(
            isAddScreen: true,
            vData: {
              CategoryKey.id: id,
              CategoryKey.name: nameController.text,
              CategoryKey.remark: remarkController.text
            },
          )),
    );
  }

}
