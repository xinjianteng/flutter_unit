import 'package:flutter_unit/common/entities/entities.dart';
import 'package:get/get.dart';

class WidgetDetailState {

// 自定义类 - 可以是任何类
  final widgetItem = WidgetsVo().obs;

  // 关联组件
  RxList<WidgetsVo> linkWidgets = <WidgetsVo>[].obs;

  // 示例
  RxList<NodeModel> nodeModels = <NodeModel>[].obs;


  WidgetDetailState() {
    ///Initialize variables
  }
}
