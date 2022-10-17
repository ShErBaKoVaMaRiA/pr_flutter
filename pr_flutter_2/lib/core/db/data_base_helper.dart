import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:pr_flutter_2/common/data_base_request.dart';
import 'package:pr_flutter_2/data/model/account.dart';
import 'package:pr_flutter_2/data/model/material.dart';
import 'package:pr_flutter_2/data/model/point_issue.dart';
import 'package:pr_flutter_2/data/model/role.dart';
import 'package:pr_flutter_2/data/model/type_product.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart' as path;
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class DataBaseHelper {
  static final DataBaseHelper instance = DataBaseHelper._instance();
  DataBaseHelper._instance();

  late final Directory _appDocumentDirectory;
  late final String _pathDB;
  late final Database dataBase;
  int _version = 1;

  Future<void> init() async {
    _appDocumentDirectory = await path.getApplicationDocumentsDirectory();
    _pathDB = join(_appDocumentDirectory.path, 'fashion_store.db');

    if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
      sqfliteFfiInit();
      dataBase = await databaseFactoryFfi.openDatabase(_pathDB,
          options: OpenDatabaseOptions(onCreate: (db, version) {
            onCreateTable(db);
          }, onUpgrade: ((db, oldVersion, newVersion) async {
            await onUpgradeTable(db);
          })));
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
      //таблица ролей
      db.insert(
          DataBaseRequest.tableRoles, Role(name_role: 'Администратор').toMap());
      db.insert(
          DataBaseRequest.tableRoles, Role(name_role: 'Пользователь').toMap());
      //таблица типов продуктов
      db.insert(DataBaseRequest.tableTypesProduct,
          Type_Product(name_type: 'Футболка').toMap());
      db.insert(DataBaseRequest.tableTypesProduct,
          Type_Product(name_type: 'Толстовка').toMap());
      //таблица пунктов выдачи
      db.insert(
          DataBaseRequest.tablePointsIssue,
          Point_Issue(
                  address: 'г. Москва, ул. Никольская, д.12',
                  shedule_work: '08:00-20:00')
              .toMap());
      db.insert(
          DataBaseRequest.tablePointsIssue,
          Point_Issue(
                  address: 'г. Самара, ул. Чернореченская, д.24',
                  shedule_work: '10:00-22:00')
              .toMap());
      //таблица материалов
      db.insert(DataBaseRequest.tableMaterials,
          Material(name_material: 'Шерсть').toMap());
      db.insert(DataBaseRequest.tableMaterials,
          Material(name_material: 'Хлопок').toMap());

      //таблица аккаунтов
      db.insert(DataBaseRequest.tableAccounts,
          Account(login: 'Admin_1', password: 'admin123', role_id: 1).toMap());
      db.insert(DataBaseRequest.tableAccounts,
          Account(login: 'User_1', password: 'user123', role_id: 1).toMap());
    } on DatabaseException catch (e) {
      print(e.result);
    }
  }

  Future<void> onDropDataBase() async {
    dataBase.close();
    if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
      databaseFactoryFfi.deleteDatabase(_pathDB);
    } else {
      deleteDatabase(_pathDB);
    }
  }
}
