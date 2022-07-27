import 'package:flutter/material.dart';
import 'package:flutter_unit/page/search/search_view.dart';
import 'package:get/get.dart';

import '../../common/style/style.dart';
import '../../common/values/values.dart';
import '../../common/widget/widgets.dart';
import '../category/category_view.dart';
import '../flutter/flutter_view.dart';
import '../my/my_view.dart';

class ApplicationState {
  RxInt position = 0.obs;
  List<Widget> pages = [
    FlutterPage(),
    CategoryPage(),
    SearchPage(),
    MyPage(),
  ];

  List<BottomNavigationBarItem> bottomTabs = <BottomNavigationBarItem>[
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.widgets,
        color: AColors.navNormal,
      ),
      activeIcon: Icon(
        Icons.widgets,
        color: AColors.navSelect,
      ),
      label: '组件',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.view_list,
        color: AColors.navNormal,
      ),
      activeIcon: Icon(
        Icons.view_list,
        color: AColors.navSelect,
      ),
      label: '分类',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.search_sharp,
        color: AColors.navNormal,
      ),
      activeIcon: Icon(
        Icons.search_sharp,
        color: AColors.navSelect,
      ),
      label: '搜索',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.person,
        color: AColors.navNormal,
      ),
      activeIcon: Icon(
        Icons.person,
        color: AColors.navSelect,
      ),
      label: '我的',
    ),
  ];

  ApplicationState();
}
