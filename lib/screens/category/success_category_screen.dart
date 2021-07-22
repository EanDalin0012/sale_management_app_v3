import 'package:flutter/material.dart';
import 'package:sale_management/screens/category/category_screen.dart';
import 'package:sale_management/screens/category/widgets/success_category_body.dart';
import 'package:sale_management/shares/statics/default.dart';
import 'package:sale_management/shares/utils/colors_utils.dart';
import 'package:easy_localization/easy_localization.dart';

class SuccessCategoryScreen extends StatefulWidget {
  final bool? isAddScreen;
  final bool? isEditScreen;
  final Map vData;
  SuccessCategoryScreen(
      {Key? key, this.isAddScreen, this.isEditScreen, required this.vData})
      : super(key: key);
  @override
  _SuccessCategoryScreenState createState() => _SuccessCategoryScreenState();
}

class _SuccessCategoryScreenState extends State<SuccessCategoryScreen> {

    @override
    Widget build(BuildContext context) {
      return WillPopScope(
        onWillPop: () => onBackPress(),
        child: Scaffold(
          backgroundColor: ColorsUtils.scaffoldBackgroundColor(),
          appBar: AppBar(
            backgroundColor: ColorsUtils.appBarBackGround(),
            elevation: DefaultStatic.elevationAppBar,
            leading: SizedBox(),
            title: Text('common.label.success'.tr()),
          ),
          body: SuccessCategoryBody(vData: widget.vData,
            isAddScreen: widget.isAddScreen,
            isEditScreen: widget.isEditScreen,),
        ),
      );
    }

    Future<bool> onBackPress() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CategoryScreen()),
      );
      return Future<bool>.value(true);
    }

}
