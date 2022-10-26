import 'package:flutter_unit/common/entities/entities.dart';

import '../../entities/widget_filter.dart';

/// create by 张风捷特烈 on 2020-03-03
/// contact me by email 1981462002@qq.com

abstract class CategoryRepository {

  //查询所有分组
  Future<List<CategoryVo>> selectAllCategory();





}
