import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_unit/common/values/colors.dart';
import 'package:flutter_unit/common/values/dimens.dart';

import '../../common/routers/routes.dart';
import 'my_logic.dart';
import 'my_state.dart';

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  final MyLogic logic = Get.put(MyLogic());
  final MyState state = Get.find<MyLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AColors.yellow,
      child: Text('ssss'),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return ListView(
  //     padding: EdgeInsets.zero,
  //     children: <Widget>[
  //       _buildItem(
  //         context,
  //         Icons.settings,
  //         '应用设置',
  //         AppRoutes.setting,
  //       ),
  //       _buildItem(
  //         context,
  //         Icons.date_range,
  //         '数据管理',
  //         AppRoutes.data_manage,
  //       ),
  //       _buildItem(
  //         context,
  //         Icons.collections,
  //         '我的收藏',
  //         AppRoutes.collect,
  //       ),
  //       _buildItem(
  //         context,
  //         Icons.info,
  //         '版本信息',
  //         AppRoutes.version_info,
  //       ),
  //       _buildItem(
  //         context,
  //         Icons.app_blocking_outlined,
  //         '关于应用',
  //         AppRoutes.about,
  //       ),
  //       _buildItem(
  //         context,
  //         Icons.connect_without_contact,
  //         '联系本王',
  //         AppRoutes.about,
  //       ),
  //     ],
  //   );
  // }

  @override
  void dispose() {
    Get.delete<MyLogic>();
    super.dispose();
  }

  Widget _buildItem(
          BuildContext context, IconData icon, String title, String linkTo,
          {VoidCallback? onTap}) =>
      Column(
        children: [
          const Divider(
            height: 1,
          ),
          ListTile(
            leading: Icon(
              icon,
              color: Theme.of(context).primaryColor,
            ),
            title: Text(title),
            trailing: Icon(
              Icons.chevron_right,
              color: Theme.of(context).primaryColor,
            ),
            onTap: () {
              if (linkTo.isNotEmpty) {
                Get.toNamed(linkTo);
                if (onTap != null) onTap();
              }
            },
          )
        ],
      );
}
