import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../common/repositiores/rep/impl/widget_db_repository.dart';
import '../../common/repositiores/rep/widget_repository.dart';
import 'flutter_state.dart';

class FlutterLogic extends GetxController {
  final FlutterState state = FlutterState();

  /// UI 组件
  final RefreshController refreshController = RefreshController(
    initialRefresh: true,
  );

  late ScrollController scrollController;

  final WidgetRepository repository = WidgetDbRepository();

  @override
  void onInit() {
    // TODO: implement onInit
    scrollController = ScrollController(keepScrollOffset: true);

    super.onInit();
  }

  /// 事件
  void onRefresh() {
    repository.selectAllWidgets().then((value) {
      state.dataList.value = value;
      refreshController.refreshCompleted();
      refreshController.loadComplete();
    }, onError: (e) {
      refreshController.refreshFailed();
    });
  }

  void onTop() {
    scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }


}
