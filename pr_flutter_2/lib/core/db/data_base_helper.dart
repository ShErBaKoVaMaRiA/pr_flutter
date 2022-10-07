import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:pr_flutter_2/common/data_base_request.dart';
import 'package:pr_flutter_2/data/model/role.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart' as path;

class DataBaseHelper {
  static final DataBaseHelper instance = DataBaseHelper._instance();
  DataBaseHelper._instance();

  late final Directory _appDocumentDirectory;
  late final String _pathDB;
  late final Database dataBase;
  int _version = 1;

  Future<void> init() async {
    _appDocumentDirectory = await path.getApplicationDocumentsDirectory();
    _pathDB = join(_appDocumentDirectory.path, 'booksstore.db');

    if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    } else {
      dataBase = await openDatabase(_pathDB,
          onUpgrade: ((db, oldVersion, newVersion) async {
        await onUpgradeTable(db);
      }), onCreate: (db, version) async {
        await onCreateTable(db);
      });
    }
  }

  Future<void> onCreateTable(Database db) async {
    for (var element in DataBaseRequest.tableCreateList) {
      await db.execute(element);
    }

    await onInitTable(db);
  }

  Future<void> onUpgradeTable(Database db) async {
    var tables = await db.rawQuery('select name from sqlite_master;');

    for (var table in DataBaseRequest.tableList.reversed) {
      if (tables.where((element) => element['name'] == table).isNotEmpty) {
        await db.execute(DataBaseRequest.deleteTable(table));
      }
    }
    for (var element in DataBaseRequest.tableCreateList) {
      await db.execute(element);
    }
    await onInitTable(db);
  }

  Future<void> onInitTable(Database db) async {
    try {
      db.insert(DataBaseRequest.tableRole, Role(role: 'Администратор').toMap());
      db.insert(DataBaseRequest.tableRole, Role(role: 'Пользователь').toMap());
    } on DatabaseException catch (e) {}
  }

  Future<void> onDropDataBase() async {
    dataBase.close();
    if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    } else {
      deleteDatabase(_pathDB);
    }
  }
}
