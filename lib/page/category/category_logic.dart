import 'package:flutter_unit/common/apis/apis.dart';
import 'package:flutter_unit/common/entities/categorys.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../common/repositiores/rep/impl/category_db_repository.dart';
import 'category_state.dart';

class CategoryLogic extends GetxController {
  final CategoryState state = CategoryState();

  /// UI 组件
  final RefreshController refreshController = RefreshController(
    initialRefresh: true,
  );

  /// 成员变量
  String categoryCode = '';

  final CategoryDbRepository repository= CategoryDbRepository();

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

    repository.selectAllCategory().then((value) {
      state.categoryList.value=value;
      refreshController.refreshCompleted();
      refreshController.loadComplete();
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
