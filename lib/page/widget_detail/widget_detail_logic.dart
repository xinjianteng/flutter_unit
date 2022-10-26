import 'package:flutter_unit/common/entities/entities.dart';
import 'package:get/get.dart';

import '../../common/repositiores/rep/impl/widget_db_repository.dart';
import '../../common/repositiores/rep/widget_repository.dart';
import 'widget_detail_state.dart';

class WidgetDetailLogic extends GetxController {
  WidgetDetailState state = WidgetDetailState();

  final WidgetRepository repository = WidgetDbRepository();

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    getWidgetById();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    state.id.value = Get.arguments;
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

//  根据id，获取组件信息
  Future<void> getWidgetById() async {
    repository.selectWidgetById(state.id.value).then((value) {
      state.widgetVo.value = value[0];
      getLinkWidgets();
      getNoteList();
    }, onError: (e) {
      print("获取组件信息异常");
    });
  }

//  获取相关联组件
  Future<void> getLinkWidgets() async {
    repository
        .selectWidgetsByIds(
            WidgetsVo.formatLinkTo(state.widgetVo.value.linkWidget!))
        .then((result) {
      state.linkWidgets.value = result;
    }, onError: (e) {
      print("获取相关联组件异常");
    });
  }

  Future<void> getNoteList() async {
    repository.selectNodeByWidgetId(state.widgetVo.value.id!).then((result) {
      state.nodeVo.value = result;
    }, onError: (e) {
      print("获取node异常");
    });
  }

// // 拉取数据
// Future<void> fetchLinkWidgetList() async {
//   var sb = StringBuffer();
//   sb.write('{"widgetId":{');
//   sb.write('"\$in":[');
//   sb.write(state.widgetModel.links);
//   sb.write("]}}");
//   // {"id":{"$in":[1,3,5,7,9]}}
//   var result = await WidgetsAPI.widgetsPageList(
//     params: WidgetsPageListRequestEntity(
//       limit: '10',
//       skip: '0',
//       count: '1',
//       where: sb.toString(),
//     ),
//   );
//   state.linkWidgets.addAll(result.results!);
//   update();
// }
//
// Future<void> fetchNodeList() async {
//   var sb = StringBuffer();
//   sb.write('{"widgetId":');
//   sb.write(state.widgetItem.value.widgetId);
//   sb.write('}');
//
//   var result = await WidgetsAPI.nodePageList(
//     params:
//         NodePageListRequestEntity(where: sb.toString(), order: "priority"),
//     cacheDisk: true,
//   );
//   state.nodeModels.addAll(result.results!);
//   update();
// }
}
