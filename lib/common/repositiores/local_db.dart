import 'dart:io';

import 'package:get/get.dart';
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart';

import 'dao/widget_dao.dart';

import '../plateform_adapter/database/db_open_helper.dart';

class LocalDb extends GetxService{
  Database? _database;

  LocalDb._();

  static LocalDb instance = LocalDb._();

  late WidgetDao _widgetDao;

  WidgetDao get widgetDao => _widgetDao;

  Database get db => _database!;


  Future<LocalDb> init() async {
    String databasesPath = await DbOpenHelper.getDbDirPath();
    String dbPath = path.join(databasesPath, "flutter.db");
    _database = await openDatabase(dbPath);
    _widgetDao = WidgetDao(_database!);

    print('初始化数据库....');
    return this;
  }

  Future<void> initDb({String name = "flutter.db"}) async {
    if (_database != null) return;
    String databasesPath = await DbOpenHelper.getDbDirPath();
    String dbPath = path.join(databasesPath, name);

    _database = await openDatabase(dbPath);

    _widgetDao = WidgetDao(_database!);

    print('初始化数据库....');
  }

  Future<void> closeDb() async {
    await _database?.close();
    _database = null;
  }


}
