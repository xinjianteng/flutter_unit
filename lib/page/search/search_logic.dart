import 'package:flutter/cupertino.dart';
import 'package:flutter_unit/common/entities/widget_filter.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../common/repositiores/rep/impl/widget_db_repository.dart';

import '../../common/repositiores/rep/widget_repository.dart';
import 'search_state.dart';

class SearchLogic extends GetxController {
  final SearchState state = SearchState();

  final WidgetRepository repository = WidgetDbRepository();

  late ScrollController scrollController;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // TODO: implement onInit
    scrollController = ScrollController(keepScrollOffset: true);
  }

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

  void search() {
    if (state.searchStr.isNotEmpty) {
      WidgetFilter widgetFilter = WidgetFilter(name: state.searchStr.value);
      repository.searchWidgets(widgetFilter).then((value) {
        state.dataList.value = value;
      }, onError: (e) {
        print('search  error');
      });
    } else {
      state.dataList.value = [];
    }
  }
}
