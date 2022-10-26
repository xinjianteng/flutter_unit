import 'package:flutter_unit/common/entities/entities.dart';
import 'package:get/get.dart';


class WidgetDetailState {
  RxInt id = 0.obs;

  final widgetVo = WidgetsVo().obs;

  // 关联组件
  RxList<WidgetsVo> linkWidgets = <WidgetsVo>[].obs;

  // 示例
  RxList<NodeVo> nodeVo = <NodeVo>[].obs;

  WidgetDetailState() {
    ///Initialize variables
  }
}
