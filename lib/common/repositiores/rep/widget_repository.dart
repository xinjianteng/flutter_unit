import '../../entities/node.dart';
import '../dao/widget_dao.dart';
import '../model/widget_filter.dart';
import '../model/widget_model.dart';

/// create by 张风捷特烈 on 2020-03-03
/// contact me by email 1981462002@qq.com

abstract class WidgetRepository {

  // Future<List<WidgetModel>> loadWidget(List<int> ids);

  Future<List<WidgetModel>> searchWidgets(WidgetFilter args);

  // Future<List<NodeModel>> loadNode(WidgetModel widgetModel);
  //
  // Future<void> toggleLike(int id);
  //
  // Future<List<WidgetModel>> loadLikeWidgets();

  // Future<int> collected(int id);
}
