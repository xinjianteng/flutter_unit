import 'package:flutter/cupertino.dart';
import 'package:flutter_unit/page/application/application_view.dart';
import 'package:flutter_unit/page/search/search_view.dart';
import 'package:flutter_unit/page/welcome/welcome_view.dart';
import 'package:flutter_unit/page/widget_detail/widget_detail_view.dart';
import 'package:get/get.dart';

import '../../page/notFound/notfound_view.dart';
import 'routes.dart';

class AppPages {
  // ignore: constant_identifier_names
  static const INITIAL = AppRoutes.welcome;
  static final RouteObserver<Route> observer = RouteObservers();
  static List<String> history = [];

  ///别名映射页面
  static final routes = [
    GetPage(
      name: AppRoutes.welcome,
      page: () => const WelcomePage(),
      transition: Transition.zoom,
    ),

    GetPage(
      name: AppRoutes.application,
      page: () => const ApplicationPage(),
      transition: Transition.zoom,
    ),

    GetPage(
      name: AppRoutes.widget_detail,
      page: () => const WidgetDetailPage(),
      transition: Transition.leftToRight,
    ),


    GetPage(
      name: AppRoutes.search,
      page: () => const SearchPage(),
      transition: Transition.leftToRight,
    ),

  ];

  static final unknownRoute = GetPage(
    name: AppRoutes.NotFound,
    page: () => const NotFoundPage(),
  );
}
