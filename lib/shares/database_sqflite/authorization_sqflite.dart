import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sale_management/shares/model/field/authorization_field.dart';
import 'package:sale_management/shares/model/key/authorization_key.dart';
import 'package:sqflite/sqflite.dart';

class AuthorizationDataBase {

  static final AuthorizationDataBase instance = AuthorizationDataBase._init();
  static Database? _dataBase;
  static String dataBaseName = AuthorizationField.dataBase;
  AuthorizationDataBase._init();

  Future<Database> get database async {
    if (_dataBase != null) return _dataBase!;
    _dataBase = await _initDB(AuthorizationField.baseFile);
    return _dataBase!;
  }

  Future<Database> _initDB(String filePath) async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final dbPath = documentsDirectory.path;
    final path = dbPath + '/' + filePath;
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY';
    final textType = 'TEXT NOT NULL';
    final boolType = 'BOOLEAN NOT NULL';
    final integerType = 'INTEGER NOT NULL';

    await db.execute('''
      CREATE TABLE $dataBaseName ( 
        ${AuthorizationField.id} $idType,
        ${AuthorizationField.accessToken} $textType, 
        ${AuthorizationField.refreshToken} $textType,
        ${AuthorizationField.expiresIn} $integerType,
        ${AuthorizationField.scope} $textType,
        ${AuthorizationField.tokenType} $textType,
        ${AuthorizationField.dateTime} $textType
        )
      ''');
  }

  static Future<int> create(Map<String, dynamic> json) async {
    print("create:"+json.toString());
    final db = await instance.database;
    var data = await db.rawInsert(
        'INSERT INTO $dataBaseName('
            '${AuthorizationField.id},'
            '${AuthorizationField.accessToken},'
            '${AuthorizationField.refreshToken},'
            '${AuthorizationField.expiresIn}, '
            '${AuthorizationField.scope},'
            '${AuthorizationField.tokenType},'
            '${AuthorizationField.dateTime}'
            ') VALUES(?, ?, ?, ?, ?, ?, ?)',
        [
          json[AuthorizationKey.id],
          json[AuthorizationKey.accessToken],
          json[AuthorizationKey.refreshToken],
          json[AuthorizationKey.expiresIn],
          json[AuthorizationKey.scope],
          json[AuthorizationKey.tokenType],
          json[AuthorizationKey.dateTime]
        ]
    );
    return data;
  }

  static Future<int> update(Map json) async {
    final db = await instance.database;
    int count = await db.rawUpdate(
        'UPDATE  $dataBaseName SET '
            '${AuthorizationField.accessToken} = ?, '
            '${AuthorizationField.refreshToken} = ?, '
            '${AuthorizationField.expiresIn} = ?, '
            '${AuthorizationField.scope} = ?, '
            '${AuthorizationField.tokenType} = ?, '
            '${AuthorizationField.dateTime} = ? '
            'WHERE ${AuthorizationField.id} = ?',
        [
          json[AuthorizationKey.accessToken],
          json[AuthorizationKey.refreshToken],
          json[AuthorizationKey.expiresIn],
          json[AuthorizationKey.scope],
          json[AuthorizationKey.tokenType],
          json[AuthorizationKey.dateTime],
          json[AuthorizationKey.id]
        ]);
    return count;
  }

  static Future<Map<String, dynamic>> getObjectById(int id) async {
    try {
      final db = await instance.database;
      List<dynamic> vData = await db.rawQuery(
          'SELECT * FROM $dataBaseName WHERE ${AuthorizationField.id} = ?',
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