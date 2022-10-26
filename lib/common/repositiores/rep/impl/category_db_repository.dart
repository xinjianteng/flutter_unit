import 'package:flutter_unit/common/entities/categorys.dart';
import 'package:flutter_unit/common/entities/widgets.dart';
import 'package:flutter_unit/common/repositiores/dao/category_dao.dart';

import '../../dao/widget_dao.dart';
import '../../local_db.dart';
import '../category_repository.dart';

/// FileName category_db_repository
///
/// @Author Administrator
/// @Date 2022/8/15 18:08
///
/// @Description TODO

class CategoryDbRepository implements CategoryRepository {

  CategoryDao get _categoryDao => LocalDb.instance.categoryDao;


  @override
  Future<List<CategoryVo>> selectAllCategory() async{
    List<Map<String, dynamic>> data = await _categoryDao.queryAll();
    List<CategoryVo> results = data.map((e) => CategoryVo.fromJson(e)).toList();
    return results;
  }




}