import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_unit/common/utils/storage_utils.dart';
import 'package:get/get.dart';

import 'common/plateform_adapter/database/db_open_helper.dart';
import 'common/repositiores/local_db.dart';
import 'common/store/config.dart';
import 'common/store/user.dart';
import 'common/utils/utils.dart';

import 'package:path/path.dart' as path;

import 'common/values/values.dart';

/// 全局静态数据
class Global {
  /// 初始化
  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    setSystemUi();
    Loading();

    await Get.putAsync<StorageService>(() => StorageService().init());

    //数据库不存在，执行拷贝
    String databasesPath = await DbOpenHelper.getDbDirPath();
    String dbPath = path.join(databasesPath, "flutter.db");

    bool shouldCopy = await _checkShouldCopy(dbPath);

    if (shouldCopy) {
      await _doCopyAssetsDb(dbPath);
    } else {
      print("=====flutter.db 已存在====");
    }
    await Get.putAsync<StorageService>(() => StorageService().init());
    await LocalDb.instance.initDb();

    Get.put<ConfigStore>(ConfigStore());
    Get.put<UserStore>(UserStore());
  }

  static void setSystemUi() {
    if (GetPlatform.isAndroid) {
      SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarDividerColor: Colors.transparent,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      );
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }
  }

  static Future<bool> _checkShouldCopy(String dbPath) async {
    bool shouldCopy = false;
    String versionStr = await rootBundle.loadString('assets/version.json');
    int dbVersion = await json.decode(versionStr)['dbVersion'];
    int versionInSP = await StorageService.to.getInt(DBVERSION_KEY) ?? -1;

    // 版本升级，执行拷贝
    if (dbVersion > versionInSP) {
      shouldCopy = true;
      await StorageService.to.setInt(DBVERSION_KEY, dbVersion);
    }

    //非 release模式，执行拷贝
    const isPro = bool.fromEnvironment('dart.vm.product');
    if (!isPro) {
      shouldCopy = true;
    }

    //数据库不存在，执行拷贝
    if (!File(dbPath).existsSync()) {
      shouldCopy = true;
    }

    return shouldCopy;
  }

  static Future<void> _doCopyAssetsDb(String dbPath) async {
    Directory dir = Directory(path.dirname(dbPath));
    if (!dir.existsSync()) {
      await dir.create(recursive: true);
    }
    ByteData data = await rootBundle.load("assets/flutter.db");
    List<int> bytes =
        data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    await File(dbPath).writeAsBytes(bytes, flush: true);

    print("=====flutter.db==== assets ======拷贝完成====");
  }
}
