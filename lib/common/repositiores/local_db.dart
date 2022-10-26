import 'package:flutter_unit/common/repositiores/dao/node_dao.dart';
import 'package:get/get.dart';
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart';

import '../plateform_adapter/database/db_open_helper.dart';
import 'dao/category_dao.dart';
import 'dao/widget_dao.dart';

class LocalDb extends GetxService {
  Database? _database;

  LocalDb._();

  static LocalDb instance = LocalDb._();

  late WidgetDao _widgetDao;

  late NodeDao _nodeDao;

  late CategoryDao _categoryDao;

  WidgetDao get widgetDao => _widgetDao;

  NodeDao get nodeDao => _nodeDao;

  CategoryDao get categoryDao => _categoryDao;

  Database get db => _database!;

  // Future<LocalDb> init() async {
  //   String databasesPath = await DbOpenHelper.getDbDirPath();
  //   String dbPath = path.join(databasesPath, "flutter.db");
  //   _database = await openDatabase(dbPath);
  //   _widgetDao = WidgetDao(_database!);
  //   _nodeDao = NodeDao(_database!);
  //   _categoryDao = CategoryDao(_database!);
  //
  //   print('初始化数据库....');
  //   return this;
  // }

  Future<void> initDb({String name = "flutter.db"}) async {
    if (_database != null) return;
    String databasesPath = await DbOpenHelper.getDbDirPath();
    String dbPath = path.join(databasesPath, name);

    _database = await openDatabase(dbPath);
    _widgetDao = WidgetDao(_database!);
    _nodeDao = NodeDao(_database!);
    _categoryDao = CategoryDao(_database!);

    print('初始化数据库....');
  }

  Future<void> closeDb() async {
    await _database?.close();
    _database = null;
  }
}
