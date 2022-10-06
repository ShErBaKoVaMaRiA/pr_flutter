import 'dart:io';

import 'package:path_provider/path_provider.dart' as path;
import 'package:sqflite/sqflite.dart';

class DataBaseHelper {
  static final DataBaseHelper instance = DataBaseHelper._instance();
  DataBaseHelper._instance();

  late final Directory _appDocumentDirectory;
  late final String _pathDB;
  late final DataBase dataBase;

  Future<void> init() async {
    _appDocumentDirectory = await
  }
}
