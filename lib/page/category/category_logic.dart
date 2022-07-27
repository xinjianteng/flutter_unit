import 'dart:io';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_unit/common/apis/apis.dart';
import 'package:flutter_unit/common/entities/categorys.dart';
import 'package:get/get.dart';

import 'category_state.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../common/style/style.dart';
import '../../common/values/values.dart';
import '../../common/widget/appbar.dart';

class CategoryLogic extends GetxController {
  final CategoryState state = CategoryState();

  /// UI 组件
  final RefreshController refreshController = RefreshController(
    initialRefresh: true,
  );

  /// 成员变量
  String categoryCode = '';


  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  /// 事件
  void onRefresh() {
    getCategoryDatas().then((_) {
      refreshController.refreshCompleted();
    }).catchError((_) {
      refreshController.refreshFailed();
    });
  }



  // 方法

  // 拉取数据
  Future<void> getCategoryDatas() async {
    var result = await CategoryAPI.categoryPageList(
      params: CategoryPageListRequestEntity(
        order: '-id',
      ),
    );
    state.categoryList.clear();
    state.categoryList.addAll(result.results!);
    update();
  }

}
