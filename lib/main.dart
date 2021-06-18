import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:sale_management/screens/choose_language/choose_language_screen.dart';
import 'package:sale_management/screens/login/login_screen.dart';
import 'package:sale_management/shares/database_sqflite/data_base_chose_language.dart';
import 'package:sale_management/shares/database_sqflite/data_base_dark_mode.dart';
import 'package:sale_management/shares/model/key/dark_mode_key.dart';
import 'package:sale_management/shares/provider/main_provider.dart';
import 'package:sale_management/shares/statics/dark_mode.dart';
import 'package:sale_management/shares/utils/device_info.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MainProvider())
      ],
      child: EasyLocalization(
          child: const MyApp(),
          supportedLocales: [
            const Locale('en'),
            const Locale('km')
          ],
          fallbackLocale: const Locale('en'),
          saveLocale: true,
          path: 'assets/i18n'
      )
  ));
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late bool chose = false;
  late FToast fToast;
  var initPlatformState = '';

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);

    DataBaseDarkModeUtils.getDarkModeById(1).then((value) {
      if (value.toString() == '{}') {
        Map json = {
          DarkModeKey.id: 1,
          DarkModeKey.code: '1' // 1=> true, 0=> false
        };
        DataBaseDarkModeUtils.create(json).then((value) {
          if (value > 0) {
            DarkMode.isDarkMode = false;
          }
        });
      } else {
        setState(() {
          Map data = value;
          if (data[DarkModeKey.code].toString() == '1') {
            DarkMode.isDarkMode = true;
          } else {
            DarkMode.isDarkMode = false;
          }
        });
      }
    });

    DataBaseChoseLanguage.getChooseLanguageById(1).then((value) {
      print("value"+value.toString());
      setState(() {
        if (value.toString() == '{}') {
          chose = false;
        } else {
          chose = true;
        }
      });
    });

    DeviceInfoUtils.initPlatformState().then((value) {
      print(value.toString());
      this.initPlatformState = value.toString();
    });

  }

// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: context.watch<MainProvider>().theme(),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: chose ? const LogInScreen() : const ChooseLanguageScreen(),
    );
  }
}