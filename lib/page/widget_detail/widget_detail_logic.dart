import 'dart:convert';

import 'package:flutter_unit/common/entities/entities.dart';
import 'package:get/get.dart';

import '../../common/apis/apis.dart';
import 'widget_detail_state.dart';

class WidgetDetailLogic extends GetxController {
  WidgetDetailState state = WidgetDetailState();

  @override
  void onReady() {
    // TODO: implement onReady
    // 接收参数
    super.onReady();
    fetchLinkWidgetList();
    fetchNodeList();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    String itemStr = Get.arguments;
    state.widgetItem.value = WidgetsVo.fromJson(json.decode(itemStr));
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  // 拉取数据
  Future<void> fetchLinkWidgetList() async {
    var sb = StringBuffer();
    sb.write('{"widgetId":{');
    sb.write('"\$in":[');
    sb.write(state.widgetItem.value.linkWidget);
    sb.write("]}}");
    // {"id":{"$in":[1,3,5,7,9]}}
    var result = await WidgetsAPI.widgetsPageList(
      params: WidgetsPageListRequestEntity(
        limit: '10',
        skip: '0',
        count: '1',
        where: sb.toString(),
      ),
    );
    state.linkWidgets.addAll(result.results!);
    update();
  }

  Future<void> fetchNodeList() async {
    var sb = StringBuffer();
    sb.write('{"widgetId":');
    sb.write(state.widgetItem.value.widgetId);
    sb.write('}');

    var result = await WidgetsAPI.nodePageList(
      params: NodePageListRequestEntity(where: sb.toString(),order: "priority"),
      cacheDisk: true,
    );
    state.nodeModels.addAll(result.results!);
    update();
  }
}
