import 'dart:async';
import 'package:sale_management/shares/model/field/dar_mode_field.dart';
import 'package:sale_management/shares/model/key/dark_mode_key.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class DataBaseDarkModeUtils {

  static final DataBaseDarkModeUtils instance = DataBaseDarkModeUtils._init();
  static Database? _dataBase;
  static String dataBaseName = DarModeField.dataBase;

  DataBaseDarkModeUtils._init();

  Future<Database> get database async {
    if (_dataBase != null) return _dataBase!;
    _dataBase = await _initDB(DarModeField.baseFile);
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
        ${DarModeField.id} $integerType, 
        ${DarModeField.code} $textType
        )
      ''');
  }

  static Future<int> create(Map json) async {
    final db = await instance.database;
    var data = await db.rawInsert(
        'INSERT INTO $dataBaseName(${DarModeField.id}, ${DarModeField.code}) VALUES(?, ?)',
        [
          json[DarkModeKey.id], json[DarkModeKey.code]
        ]
    );
    print('create: ${data}');
    return data;
  }

  static Future<int> update(Map json) async {
    final db = await instance.database;
    int count = await db.rawUpdate(
        'UPDATE  $dataBaseName SET ${DarModeField.code} = ? WHERE ${DarkModeKey
            .id} = ?',
        [
          json[DarkModeKey.code], json[DarkModeKey.id]
        ]);
    print('updated: $count');
    return count;
  }

  static Future<Map> getDarkModeById(int id) async {
    try {
      final db = await instance.database;
      List<dynamic> vData = await db.rawQuery(
          'SELECT * FROM $dataBaseName WHERE id = ?', [id]);
      if (vData.length > 0) {
        return vData[0];
      }
    } catch (e) {
      print('e :${e}');
    }
    return {};
  }

}
