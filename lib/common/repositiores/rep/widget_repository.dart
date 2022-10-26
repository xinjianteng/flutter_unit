import 'package:flutter_unit/common/entities/entities.dart';

import '../../entities/widget_filter.dart';


abstract class WidgetRepository {


  Future<List<WidgetsVo>> searchWidgets(WidgetFilter args);


//  查询所有组件
  Future<List<WidgetsVo>> selectAllWidgets();


  Future<List<WidgetsVo>> selectWidgetById(int id);



  Future<List<WidgetsVo>> selectWidgetsByIds(List<int>? ids);


  Future<List<NodeVo>> selectNodeByWidgetId(int widgetId);



  //
  // Future<void> toggleLike(int id);
  //
  // Future<List<WidgetModel>> loadLikeWidgets();

  // Future<int> collected(int id);



}
