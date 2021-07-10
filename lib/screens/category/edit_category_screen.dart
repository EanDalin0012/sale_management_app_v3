import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sale_management/screens/category/widgets/edit_category_body.dart';
import 'package:sale_management/shares/statics/default.dart';
import 'package:sale_management/shares/utils/colors_utils.dart';
import 'package:sale_management/shares/utils/toast_util.dart';

class EditCategoryScreen extends StatefulWidget {
  final Map vData;

  const EditCategoryScreen({Key? key, required this.vData}) : super(key: key);

  @override
  _EditCategoryScreenState createState() => _EditCategoryScreenState();
}

class _EditCategoryScreenState extends State<EditCategoryScreen> {

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
          elevation: DefaultStatic.elevationAppBar,
          title: Text('category.label.category'.tr()),
        ),
        body: SafeArea(
          child: EditCategoryBody(vData: widget.vData, onChanged: (value) {
            setState(() {
              this.loading = value;
            });
          },),
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
