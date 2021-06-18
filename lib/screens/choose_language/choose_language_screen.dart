import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sale_management/screens/login/login_screen.dart';
import 'package:sale_management/shares/database_sqflite/data_base_chose_language.dart';
import 'package:sale_management/shares/model/key/choose_language_key.dart';
import 'package:sale_management/shares/model/key/language_key.dart';
import 'package:sale_management/shares/statics/fonts.dart';
import 'package:sale_management/shares/utils/size_config_utils.dart';
import 'package:sale_management/shares/widgets/elevate_button_next/elevate_button_next.dart';
import 'package:sale_management/shares/widgets/icon_check/icon_check.dart';
import 'package:easy_localization/easy_localization.dart';

class ChooseLanguageScreen extends StatefulWidget {
  const ChooseLanguageScreen({Key? key}) : super(key: key);
  @override
  _ChooseLanguageScreenState createState() => _ChooseLanguageScreenState();
}

class _ChooseLanguageScreenState extends State<ChooseLanguageScreen> {

  List<dynamic> vData = [
    {
      LanguageKey.code: 'kh',
      LanguageKey.text: 'ខ្មែរ',
      'url': 'assets/countries/kh.svg'
    },
    {
      LanguageKey.code: 'en',
      LanguageKey.text: 'English',
      'url': 'assets/countries/gb.svg'
    }
    // {
    //   LanguageKey.code: 'zn',
    //   LanguageKey.text: '中文',
    //   'url': 'assets/countries/cn.svg'
    // }
  ];

  late Size size;
  double height = 0.0;
  var code = 'en';
  var color = const Color(0xff6E747F);

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = (size.height - SizeConfigUtils.screenHeight * 0.06 - SizeConfigUtils.screenHeight * 0.06);
    SizeConfigUtils.init(context);
    return Scaffold(
      backgroundColor: const Color(0xff273955),
      body: Column(
          children: <Widget>[
            SizedBox(height: SizeConfigUtils.screenHeight * 0.06),
            const Center(
                child: Text('Choose the language', style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  //fontFamily: fontDefault)),
                ),
                )
            ),
            SizedBox(height: SizeConfigUtils.screenHeight * 0.06),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide( //                    <--- top side
                      color: Colors.white,
                      width: 0.6,
                    ),
                  ),
                ),
                child: Column(
                  children: vData.map((e) => _container(e)).toList(),
                ),
              ),
            ),
            ElevatedButtonNext(
              onPressed: () {
                DataBaseChoseLanguage.getChooseLanguageById(1).then((value) async {
                  if (value.toString() == '{}') {
                    Map json = {
                      ChooseLanguageKey.id: 1,
                      ChooseLanguageKey.choose: '1'
                    };
                    DataBaseChoseLanguage.create(json).then((value) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const LogInScreen()),
                      );
                    });
                  }
                  if (code == 'en') {
                    await context.setLocale(context.supportedLocales[0]);
                  } else if (code == 'kh') {
                    await context.setLocale(context.supportedLocales[1]);
                  }
                });
              },
            ),
          ]
      ),
    );
  }

  Widget _container(Map map) {
    var isCheck = false;
    if (map[LanguageKey.code] == code) {
      isCheck = true;
    }
    return InkWell(
      onTap: () {
        setState(() {
          code = map[LanguageKey.code];
        });
      },
      child: Container(
        decoration: BoxDecoration(
          border: isCheck ? Border(
            top: BorderSide(width: 1, color: color),
            bottom: BorderSide(width: 1, color: color),
          ) : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 55,
              height: 55,
              margin: const EdgeInsets.all(15),
              child: _buildFlag(map['url'].toString()),
            ),
            Expanded(
              flex: 1,
              child: Container(
                width: 50.0,
                height: 50.0,
                padding: const EdgeInsets.only(top: 10),
                child: Text(map[LanguageKey.text], style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    fontFamily: fontDefault)),
              ),
            ),
            isCheck ? const IconCheck() : Container()
          ],
        ),
      ),
    );
  }

  Widget _buildFlag(String url) {
    return SvgPicture.asset(
      url.toString(),
      height: 50,
    );
  }

}
