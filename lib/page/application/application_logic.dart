import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'application_state.dart';

class ApplicationLogic extends GetxController {
  final state = ApplicationState();

  // 页控制器
  late  PageController pageController;

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: state.position.value);
  }

  // tab栏页码切换
  void handlePageChanged(int index) {
    state.position.value = index;
  }

  // tab栏动画
  void handleNavBarTap(int index) {
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 200),
      curve: Curves.ease,
    );
    state.position.value = index;
  }

  void changeTheme() {
    Get.changeTheme(Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
  }
}
