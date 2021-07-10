import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:sale_management/screens/category/widgets/add_new_category_body.dart';
import 'package:sale_management/shares/statics/default.dart';
import 'package:sale_management/shares/utils/colors_utils.dart';
import 'package:sale_management/shares/utils/toast_util.dart';

class AddNewCategoryScreen extends StatefulWidget {
  const AddNewCategoryScreen({Key? key}) : super(key: key);

  @override
  _AddNewCategoryScreenState createState() => _AddNewCategoryScreenState();
}

class _AddNewCategoryScreenState extends State<AddNewCategoryScreen> {
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
          leading: IconButton(
            icon: FaIcon(
                FontAwesomeIcons.arrowLeft, color: Colors.white, size: 19
            ),
            color: Colors.white,
            onPressed: () {
              if(loading == true) {
                ToastUtils.showToast(context: 'common.label.isLoadingCanNotBack'.tr(), fToast: fToast, duration: 2);
              } else {
                Navigator.of(context).pop();
              }

            },
          ),
          backgroundColor: ColorsUtils.appBarBackGround(),
          elevation: DefaultStatic.elevationAppBar,
          title: Text('category.label.category'.tr()),
        ),
        body: SafeArea(
          child: AddBewCategoryBody(
            onChanged: (value) {
              print(value);
              setState(() {
                this.loading = value;
              });
            },
          ),
        ),
      ),
    );
  }

  Future<bool> onBackPress() {
    if(loading == true) {
      ToastUtils.showToast(context: 'common.label.isLoadingCanNotBack'.tr(), fToast: fToast, duration: 2);
      return Future<bool>.value(false);
    } else {
      return Future<bool>.value(true);
    }
  }

}
