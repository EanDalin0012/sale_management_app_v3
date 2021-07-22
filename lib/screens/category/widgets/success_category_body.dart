
import 'package:flutter/material.dart';
import 'package:sale_management/screens/category/category_screen.dart';
import 'package:sale_management/shares/model/key/category_key.dart';
import 'package:sale_management/shares/statics/default.dart';
import 'package:sale_management/shares/utils/format_date.dart';
import 'package:sale_management/shares/utils/size_config_utils.dart';
import 'package:sale_management/shares/utils/text_style_util.dart';
import 'package:sale_management/shares/widgets/elevate_button_back/elevate_button_back.dart';
import 'package:easy_localization/easy_localization.dart';

class SuccessCategoryBody extends StatefulWidget {
  final bool? isAddScreen;
  final bool? isEditScreen;
  final Map vData;
  SuccessCategoryBody({Key? key, this.isEditScreen, this.isAddScreen, required this.vData}) : super(key: key);

  @override
  _SuccessCategoryBodyState createState() => _SuccessCategoryBodyState();
}

class _SuccessCategoryBodyState extends State<SuccessCategoryBody> {
  @override
  Widget build(BuildContext context) {
    Map json = {
      CategoryKey.id: widget.vData[CategoryKey.id],
      CategoryKey.name: widget.vData[CategoryKey.name],
      CategoryKey.remark: widget.vData[CategoryKey.remark]
    };
    String transactionDate = "202104131200";

    return Column(
      children: <Widget>[
        SizedBox(height: SizeConfigUtils.screenHeight * 0.07),
        Center(
          child: Image.asset(
            DefaultStatic.assetsSuccessPathImage,
            height: SizeConfigUtils.screenHeight * 0.2, //40%
          ),
        ),
        SizedBox(height: SizeConfigUtils.screenHeight * 0.07),
        Center(
          child: Column(
            children: <Widget>[
              SizedBox(height: SizeConfigUtils.screenHeight * 0.04), // 4%
              if (widget.isAddScreen == true)
                Text('category.label.registerCategory'.tr(),
                    style: TextStyleUtils.headingStyle()),
              if(widget.isEditScreen == true)
                Text('category.label.updateCategory'.tr(),
                    style: TextStyleUtils.headingStyle()),
              Center(
                child: Text(
                  'common.label.success'.tr(),
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(30),
                    fontWeight: FontWeight.bold,
                    color: Colors.green[800],
                  ),
                ),
              ),
              _buildCard(dataItem: json, transactionDate: transactionDate)
            ],
          ),
        ),
        SizedBox(height: SizeConfigUtils.screenHeight * 0.02),
        Container(
          width: MediaQuery.of(context).size.width - getProportionateScreenWidth(40),
          child: ElevatedButtonBack(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CategoryScreen()),
                );
              }
          ),
        ),
        Spacer(),
      ],
    );
  }

  Widget _buildCard({required Map dataItem, required String transactionDate}) {
    return Padding(
      padding: EdgeInsets.only(left: 3, right: 3, top: 3, bottom: 3),
      child: Column(
        children: <Widget>[
          Container(
            height: 130,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Color(0xFF22293D),
                borderRadius: BorderRadius.circular(15)
            ),
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Text('sale.label.sell'.tr()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text( 'common.label.ID'.tr() + ' :'),
                      Text(dataItem[CategoryKey.id].toString()),
                    ],
                  ),
                  SizedBox(height: SizeConfigUtils.screenHeight * 0.01),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text( 'category.label.categoryName'.tr() + ' :'),
                      Text(dataItem[CategoryKey.name].toString()),
                    ],
                  ),
                  SizedBox(height: SizeConfigUtils.screenHeight * 0.01),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('common.label.remark'.tr() + ' :'),
                      Text(dataItem[CategoryKey.remark].toString()),
                    ],
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text( FormatDateUtils.dateFormat(yyyyMMdd: transactionDate.substring(0,8)) + ' '+ FormatDateUtils.dateTime(hhnn: transactionDate.substring(8,12)) + ' AM'),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
