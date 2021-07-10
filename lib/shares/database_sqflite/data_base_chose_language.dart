
import 'package:sale_management/shares/model/field/chose_language_field.dart';
import 'package:sale_management/shares/model/key/choose_language_key.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class DataBaseChoseLanguage {
  static final DataBaseChoseLanguage instance = DataBaseChoseLanguage._init();
  static Database? _dataBase;
  static String dataBaseName = ChoseLanguageField.dataBase;

  DataBaseChoseLanguage._init();

  Future<Database> get database async {
    if (_dataBase != null) return _dataBase!;
    _dataBase = await _initDB(ChoseLanguageField.baseFile);
    return _dataBase!;
  }

  Future<Database> _initDB(String filePath) async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final dbPath = documentsDirectory.path;
    final path = dbPath + '/' + filePath;
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';
    final boolType = 'BOOLEAN NOT NULL';
    final integerType = 'INTEGER NOT NULL';

    await db.execute('''
      CREATE TABLE $dataBaseName ( 
        ${ChoseLanguageField.id} $integerType, 
        ${ChoseLanguageField.choose} $textType
        )
      ''');
  }

  static Future<int> create(Map json) async {
    final db = await instance.database;
    var data = await db.rawInsert(
        'INSERT INTO $dataBaseName(${ChoseLanguageField.id}, ${ChoseLanguageField.choose}) VALUES(?, ?)',
        [
          json[ChooseLanguageKey.id], json[ChooseLanguageKey.choose]
        ]
    );
    return data;
  }

  static Future<Map> getChooseLanguageById(int id) async {
    try {
      final db = await instance.database;
      List<dynamic> vData = await db.rawQuery(
          'SELECT * FROM $dataBaseName WHERE ${ChoseLanguageField.id} = ?',
          [id]);
      if (vData.length > 0) {
        return vData[0];
      }
    } catch (e) {
      print('e :${e}');
    }
    return {};
  }

}
