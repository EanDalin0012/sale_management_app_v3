import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sale_management/screens/category/add_new_category_screen.dart';
import 'package:sale_management/screens/category/edit_category_screen.dart';
import 'package:sale_management/screens/home/home_screen.dart';
import 'package:sale_management/shares/model/key/category_key.dart';
import 'package:sale_management/shares/statics/default.dart';
import 'package:sale_management/shares/statics/fonts.dart';
import 'package:sale_management/shares/utils/colors_utils.dart';
import 'package:sale_management/shares/utils/keyboard_util.dart';
import 'package:sale_management/shares/utils/show_dialog_util.dart';
import 'package:sale_management/shares/utils/toast_util.dart';
import 'package:http/http.dart' as http;
import 'package:sale_management/shares/widgets/app_bar_actions/appBarActions.dart';
import 'package:sale_management/shares/widgets/circular_progress_indicator/circular_progress_indicator.dart';
import 'package:sale_management/shares/widgets/floating_action_button/floating_action_button.dart';
import 'package:sale_management/shares/widgets/over_list_item/over_list_item.dart';
import 'package:sale_management/shares/widgets/search_widget/search_widget.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  var isNative = false;
  bool isSearch = false;
  late Size size;
  late FToast fToast;
  List<dynamic> vData = [];

  var menuStyle;

  @override
  void initState() {
    this._fetchItems();
    fToast = FToast();
    fToast.init(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    this.menuStyle = TextStyle(color: ColorsUtils.isDarkModeColor(),
        fontWeight: FontWeight.w500,
        fontFamily: fontDefault);
    return WillPopScope(
      onWillPop: () => onBackPress(),
      child: Scaffold(
          backgroundColor: ColorsUtils.scaffoldBackgroundColor(),
          appBar: _buildAppBar(),
          body: SafeArea(
            child: this.vData.length > 0 ? GestureDetector(
              onTap: () {
                KeyboardUtil.hideKeyboard(context);
              },
              child: Column(
                children: <Widget>[
                  OverListItem(
                    text: 'category.label.categoryList'.tr(),
                    length: this.vData.length,
                  ),
                  _buildBody()
                ],
              ),
            ) : CircularProgressLoading(),
          ),
          floatingActionButton:  WidgetFloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddNewCategoryScreen()),
              );
            },
          )
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: ColorsUtils.appBarBackGround(),
      elevation: DefaultStatic.elevationAppBar,
      title: Text('category.label.category'.tr()),
      leading: IconButton(
        icon: FaIcon(
            FontAwesomeIcons.arrowLeft, color: Colors.white, size: 19
        ),
        onPressed: () {
          KeyboardUtil.hideKeyboard(context);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen(selectIndex: 0)),
          );
        },
      ),
      actions: [
        WidgetAppBarAction(
            onChanged: (v) => setState(() {
              this.isNative = v;
            }),
            isNative: this.isNative
        ),
        const SizedBox(width: 8),
      ],
      bottom: this.isNative ? PreferredSize(preferredSize: Size.fromHeight(60),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: size.width - 40,
              height: 65,
              margin: EdgeInsets.only(left: 18),
              padding: EdgeInsets.only(bottom: 10, top: 10),
              child: SearchWidget(
                hintText: 'search.label.searchName'.tr(),
                text: 'search.label.search'.tr(),
                onChanged: (String value) {
                  print(value);
                },
              ),
            ),
            // _buildFilterByProduct()
          ],
        ),
      ) : null,
    );
  }

  Expanded _buildBody() {
    return Expanded(
        child: this.vData.length > 0 ? ListView.separated(
          itemCount: this.vData.length,
          separatorBuilder: (context, index) =>
              Divider(
                  color: ColorsUtils.isDarkModeColor()
              ),
          itemBuilder: (context, index) {
            return _buildListTile(
                dataItem: this.vData[index]
            );
          },
        ) : Container()
    );
  }

  Widget _buildListTile({
    required Map dataItem
  }) {
    return ListTile(
      title: Text(dataItem[CategoryKey.name],
        style: TextStyle(color: ColorsUtils.isDarkModeColor(),
            fontSize: 20,
            fontWeight: FontWeight.w700,
            fontFamily: fontDefault),
      ),
      subtitle: Text(
        dataItem[CategoryKey.remark].toString(),
        style: TextStyle(fontSize: 12,
            fontWeight: FontWeight.w700,
            fontFamily: fontDefault,
            color: ColorsUtils.isDarkModeColor()),
      ),
      trailing: Column(
        children: <Widget>[
          _offsetPopup(dataItem),
        ],
      ),
    );
  }

  Widget _offsetPopup(Map item) =>
      PopupMenuButton<int>(
        itemBuilder: (context) =>
        [
          PopupMenuItem(
              value: 0,
              child: Row(
                children: <Widget>[
                  FaIcon(FontAwesomeIcons.edit, size: 20,
                      color: ColorsUtils.iConColor()),
                  SizedBox(width: 10,),
                  Text(
                    'common.label.edit'.tr(),
                    style: menuStyle,
                  ),
                ],
              )
          ),
          PopupMenuItem(
              value: 1,
              child: Row(
                children: <Widget>[
                  FaIcon(
                      FontAwesomeIcons.trash,
                      size: 20,
                      color: ColorsUtils.iConColor()
                  ),
                  SizedBox(width: 10,),
                  Text(
                    'common.label.delete'.tr(),
                    style: menuStyle,
                  ),
                ],
              )
          ),
        ],
        icon: FaIcon(
            FontAwesomeIcons.ellipsisV, size: 15,
            color: ColorsUtils.isDarkModeColor()
        ),
        tooltip: 'Hello',
        offset: Offset(0, 45),
        color: ColorsUtils.offsetPopup(),
        onSelected: (value) {
          if (value == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => EditCategoryScreen(vData: item)),
            );
          } else if (value == 1) {
            _showDialog(item);
            // getJson();
          }
        },
      );

  void _showDialog(Map item) {
    ShowDialogUtil.showDialogYesNo(
        buildContext: context,
        title: Text(item[CategoryKey.name], style: TextStyle(color: ColorsUtils.isDarkModeColor()),),
        content: Text('category.message.doYouWantToDeleteCategory'.tr(
            args: [item[CategoryKey.name]]), style: TextStyle(color: ColorsUtils.isDarkModeColor())),
        onPressedYes: () {
          print('onPressedBntRight');
        },
        onPressedNo: () {
          print('onPressedBntLeft');
        }
    );
  }

  _fetchItems() async {
    await Future.delayed(Duration(seconds: 1));
    final data = await rootBundle.loadString(
        'assets/json_data/category_list.json');
    Map mapItems = jsonDecode(data);
    setState(() {
      this.vData = mapItems['categoryList'];
    });
    return this.vData;
  }

  Future<bool> onBackPress() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen(selectIndex: 0)),
    );
    return Future<bool>.value(true);
  }

  void getJson() async {
    print('getJson');
    String url = 'https://run.mocky.io/v3/02a7d93f-1def-42f0-89b0-ded89037862e';
    try{
      http.read(Uri.parse(url)).then((value) {
        ToastUtils.showToast(context: value.toString(), fToast: fToast, duration: 2);
        print('data');
      });
    }catch(err) {
      print('err:'+err.toString());
    };

    // return http.get(Uri.parse(url)).then((response) {
    //   print(response.statusCode);
    // });
  }

  Future<http.Response> fetchAlbum() {
    return http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
  }

}
