import 'package:flutter_unit/common/entities/entities.dart';
import 'package:flutter_unit/common/repositiores/dao/node_dao.dart';

import '../../../entities/widgets.dart';
import '../../dao/widget_dao.dart';
import '../../local_db.dart';
import '../../../entities/widget_filter.dart';
import '../../rep/widget_repository.dart';

/// create by 张风捷特烈 on 2020-03-03
/// contact me by email 1981462002@qq.com
/// 说明 : Widget数据仓库

class WidgetDbRepository implements WidgetRepository {
  WidgetDao get _widgetDao => LocalDb.instance.widgetDao;

  NodeDao get _nodeDao => LocalDb.instance.nodeDao;


  @override
  Future<List<WidgetsVo>> searchWidgets(WidgetFilter args) async {
    List<Map<String, dynamic>> data = await _widgetDao.search(args);
    List<WidgetsVo> results = data.map((e) => WidgetsVo.fromJson(e)).toList();
    return results;
  }

  @override
  Future<List<WidgetsVo>> selectAllWidgets() async {
    List<Map<String, dynamic>> data = await _widgetDao.queryAll();
    List<WidgetsVo> results = data.map((e) => WidgetsVo.fromJson(e)).toList();
    return results;
  }

  @override
  Future<List<WidgetsVo>> selectWidgetById(int id) async {
    List<Map<String, dynamic>> data = await _widgetDao.queryById(id);
    List<WidgetsVo> results = data.map((e) => WidgetsVo.fromJson(e)).toList();
    return results;
  }

  @override
  Future<List<WidgetsVo>> selectWidgetsByIds(List<int>? id) async {
    if (id == null) {
      return [];
    } else {
      List<Map<String, dynamic>> data = await _widgetDao.queryByIds(id);
      List<WidgetsVo> results = data.map((e) => WidgetsVo.fromJson(e)).toList();
      return results;
    }
  }

  @override
  Future<List<NodeVo>> selectNodeByWidgetId(int widgetId) async {

    List<Map<String, dynamic>> data = await _nodeDao.queryByWidgetId(widgetId);

    List<NodeVo> nodes = data.map((e) => NodeVo.fromJson(e)).toList();
    return nodes;
  }

//
// @override
// Future<void> toggleLike(
//   int id,
// ) {
//   return _likeDao.toggleCollect(id);
// }
//
//
// @override
// Future<int> collected(int id) async{
//   return await _likeDao.like(id);
// }
}
