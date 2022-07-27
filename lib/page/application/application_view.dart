import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/style/style.dart';
import '../../common/values/values.dart';
import '../../common/widget/widgets.dart';
import 'application_logic.dart';
import 'application_state.dart';

class ApplicationPage extends StatefulWidget {
  const ApplicationPage({Key? key}) : super(key: key);

  @override
  _ApplicationPageState createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {
  final ApplicationLogic logic = Get.put(ApplicationLogic());
  final ApplicationState state = Get.find<ApplicationLogic>().state;

  // 内容页
  Widget _buildPageView() {
    return PageView(
      physics: const AlwaysScrollableScrollPhysics(),
      children: state.pages,
      controller: logic.pageController,
      onPageChanged: logic.handlePageChanged,
    );
  }

  // 底部导航
  Widget _buildBottomNavigationBar() {
    return Obx(() => BottomNavigationBar(
          items: logic.state.bottomTabs,
          currentIndex: logic.state.position.value,
          fixedColor: AColors.primaryButton,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: TextStyleUnit.navSelect,
          unselectedLabelStyle: TextStyleUnit.navNormal,
          onTap: logic.handleNavBarTap,
          showSelectedLabels: true,
          showUnselectedLabels: true,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildPageView(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  @override
  void dispose() {
    Get.delete<ApplicationLogic>();
    super.dispose();
  }


}
