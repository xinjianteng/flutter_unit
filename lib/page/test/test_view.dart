import 'package:flutter/material.dart';
import 'package:flutter_unit/page/flutter/flutter_view.dart';
import 'package:get/get.dart';

import 'test_logic.dart';

class TestPage extends StatelessWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(TestLogic());
    final state = Get.find<TestLogic>().state;

    return FlutterPage();
  }
}
