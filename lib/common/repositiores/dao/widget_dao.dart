import 'package:sqflite/sqflite.dart';

import '../../entities/enums.dart';
import '../bean/widget_po.dart';
import '../../entities/widget_filter.dart';

class WidgetDao {
  final Database db;

  WidgetDao(this.db);

  Future<int> insert(WidgetPo widget) async {
    //插入方法
    String addSql = //插入数据
        "INSERT INTO "
        "widget(id,name,nameCN,deprecated,family,lever,linkWidget,info) "
        "VALUES (?,?,?,?,?,?,?,?);";
    return db.transaction((tran) async => await tran.rawInsert(addSql, [
          widget.id,
          widget.name,
          widget.nameCN,
          widget.deprecated,
          widget.family,
          widget.lever,
          widget.linkWidget,
          widget.info
        ]));
  }

  Future<List<Map<String, dynamic>>> queryAll() async {
    return db.query('widget');
  }

  Future<List<Map<String, dynamic>>> queryByFamily(WidgetFamily family) async {
    return db.rawQuery(
        "SELECT * "
        "FROM widget WHERE family = ? ORDER BY lever DESC",
        [family.index]);
  }

  Future<List<Map<String, dynamic>>> queryByIds(List<int> ids) async {
    if (ids.isEmpty) {
      return [];
    }
    return db.query('widget',
        distinct: true,
        where: 'id=?',
        whereArgs: [...ids]);
  }

  Future<List<Map<String, dynamic>>> queryById(int id) async {
    return db.query('widget',
        distinct: true,
        where: 'id=?',
        whereArgs: [id]);
  }

  // List<Map<String, dynamic>> result = await database.query(
  // ‘test’，
  // distinct: true, // 是否是独特的，即是否不让重复
  // columns: ['name','value'], // 需要查询的列
  // where: 'age > ?', // 查询条件
  // whereArgs: [16], // 查询条件参数
  // groupBy: 'name', // 按列分组
  // having: 'count(name) < 2', // 给分组设置条件
  // orderBy: 'name asc', // 按列排序 asc/desc
  // limit: 5, // 限制查询结果数量
  // offset: 2, // 跳过几条数据
  // );
  //
  //
  // List<Map<String, dynamic>> result = await database.rawQuery(
  // 'SELECT distinct name, value FROM test WHERE age > ? group by name having count(name) < 2 order by name asc limit 5 offset 2',
  // [16],
  // );

  Future<List<Map<String, dynamic>>> search(WidgetFilter arguments) async {
    // 保证 name 参数为空时，不进行搜索
    if (arguments.name.isEmpty) {
      return [];
    }
    // _表示 name 任意
    String name = arguments.name == '*' ? '' : arguments.name;

    bool hasFamily = arguments.family != null;

    String familySql = hasFamily ? ' AND family = ?' : '';

    List<int> familyArg = hasFamily ? [arguments.family!.index] : [];

    List<int> starArg = arguments.stars;

    // 保证在星级参数是 [-1,-1,-1,-1,-1] 时，搜索全星级
    if (arguments.stars.reduce((a, b) => a + b) == -5) {
      starArg = [1, 2, 3, 4, 5];
    }

    return db.rawQuery(
        "SELECT * "
        "FROM widget WHERE name like ?$familySql AND lever IN(?,?,?,?,?) ORDER BY lever DESC",
        ["%$name%", ...familyArg, ...starArg]);
  }
}
