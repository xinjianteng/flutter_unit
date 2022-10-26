import 'package:flutter_unit/common/entities/widget_filter.dart';
import 'package:get/get.dart';

import '../../common/entities/widgets.dart';

class SearchState {
  RxString searchStr = ''.obs;
  // 组件列表
  RxList<WidgetsVo> dataList = <WidgetsVo>[].obs;

  SearchState() {
    ///Initialize variables
  }
}
