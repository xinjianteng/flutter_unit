import 'package:flutter_unit/common/entities/categorys.dart';
import 'package:flutter_unit/common/entities/entities.dart';

import '../utils/http_utils.dart';
import '../values/values.dart';

/// 分类
class CategoryAPI {
  /// 翻页
  /// refresh 是否刷新
  static Future<CategoryPageListResponseEntity> categoryPageList({
    CategoryPageListRequestEntity? params,
    bool refresh = false,
    bool cacheDisk = false,
  }) async {
    var response = await HttpUtil().get(
      '/classes/category',
      queryParameters: params?.toJson(),
      refresh: refresh,
      cacheDisk: cacheDisk,
      cacheKey: STORAGE_INDEX_NEWS_CACHE_KEY,
    );
    return CategoryPageListResponseEntity.fromJson(response);
  }



}
