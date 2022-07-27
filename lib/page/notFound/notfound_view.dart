import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/routers/names.dart';


class NotFoundPage extends StatelessWidget {
  const NotFoundPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("路由没有找到"),
      ),
      body: ListTile(
        title: const Text("返回首页"),
        subtitle: const Text('返回首页'),
        onTap: () => Get.offAllNamed(AppRoutes.nav),
      ),
    );
  }
}
