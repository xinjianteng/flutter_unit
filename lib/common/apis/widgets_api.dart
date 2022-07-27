import 'package:flutter_unit/common/entities/entities.dart';

import '../utils/http_utils.dart';
import '../values/values.dart';

/// 组件
class WidgetsAPI {
  /// 翻页
  /// refresh 是否刷新
  static Future<WidgetPageListResponseEntity> widgetsPageList({
    WidgetsPageListRequestEntity? params,
    bool refresh = false,
    bool cacheDisk = false,
  }) async {
    var response = await HttpUtil().get(
      '/classes/widget',
      queryParameters: params?.toJson(),
      refresh: refresh,
      cacheDisk: cacheDisk,
      cacheKey: STORAGE_INDEX_NEWS_CACHE_KEY,
    );
    return WidgetPageListResponseEntity.fromJson(response);
  }


  static Future<NodePageListResponseEntity> nodePageList({
    NodePageListRequestEntity? params,
    bool cacheDisk = false,
  }) async {
    var response = await HttpUtil().get(
      '/classes/node',
      queryParameters: params?.toJson(),
      cacheDisk: cacheDisk,
      cacheKey: STORAGE_INDEX_NODE_CACHE_KEY,
    );
    return NodePageListResponseEntity.fromJson(response);
  }

}
