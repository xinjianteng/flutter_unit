import 'dart:ffi';

import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../common/apis/apis.dart';
import '../../common/entities/widgets.dart';
import '../../common/repositiores/model/enums.dart';
import '../../common/repositiores/model/widget_filter.dart';
import '../../common/repositiores/rep/impl/widget_db_repository.dart';
import '../../common/repositiores/rep/widget_repository.dart';
import '../../common/utils/convert.dart';
import 'flutter_state.dart';

class FlutterLogic extends GetxController {
  final FlutterState state = FlutterState();

  /// UI 组件
  final RefreshController refreshController = RefreshController(
    initialRefresh: true,
  );

  final WidgetRepository repository = WidgetDbRepository();

  /// 响应式成员变量

  /// 成员变量
  String categoryCode = '';
  int curPage = 1;
  int pageSize = 20;
  int total = 20;

  void onRefresh2() {
    WidgetFamily widgetFamily = Convert.toFamily(0);
    WidgetFilter filter = WidgetFilter.family(widgetFamily);
    var result = repository.searchWidgets(filter);

  }

  /// 事件
  void onRefresh() {
    curPage = 1;
    fetchNewsList(isRefresh: true).then((_) {
      refreshController.refreshCompleted();
    }).catchError((_) {
      refreshController.refreshFailed();
    });
  }

  void onLoading() {
    if (state.newsList.length < total) {
      fetchNewsList().then((_) {
        refreshController.loadComplete();
      }).catchError((_) {
        refreshController.loadFailed();
      });
    } else {
      refreshController.loadNoData();
    }
  }

  // 方法

  // 拉取数据
  Future<void> fetchNewsList({bool isRefresh = false}) async {
    var result = await WidgetsAPI.widgetsPageList(
      params: WidgetsPageListRequestEntity(
        limit: pageSize.toString(),
        skip: curPage.toString(),
        count: '20',
        order: '-lever',
      ),
    );
    if (isRefresh == true) {
      total = result.count;
      state.newsList.clear();
    }
    curPage++;
    state.newsList.addAll(result.results!);
    update();
  }
}
