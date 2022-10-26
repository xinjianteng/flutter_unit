import 'package:flutter/material.dart';
import 'package:flutter_unit/common/routers/routes.dart';
import 'package:flutter_unit/page/flutter/widget/techno_widget_list_item.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../common/entities/entities.dart';
import '../../common/style/style.dart';
import '../../common/values/values.dart';
import '../../common/widget/widgets.dart';
import 'flutter_logic.dart';



import 'package:flutter/material.dart';


class FlutterPage extends StatelessWidget {

  final logic = Get.put(FlutterLogic());
  final state = Get.find<FlutterLogic>().state;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AColors.primaryBackground,
      appBar: _buildAppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: logic.onTop,
        child: const Icon(Icons.vertical_align_top),
      ),
      body: GetX<FlutterLogic>(
        init: logic,
        initState: (_) {},
        builder: (logic) {
          return SmartRefresher(
            controller: logic.refreshController,
            onRefresh: logic.onRefresh,
            enablePullUp: false,
            enablePullDown: true,
            child: ListView(
              controller: logic.scrollController,
              children: logic.state.dataList
                  .map((element) => widgetItem(element))
                  .toList(),
            ),
          );
        },
      ),
    );
  }


  Widget widgetItem(WidgetsVo item) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 10,
        top: 2,
        left: 10,
        right: 10,
      ),
      child: InkWell(
        onTap: () => {Get.toNamed(AppRoutes.widget_detail, arguments: item.id)},
        child: TechnoWidgetListItem(data: item),
      ),
    );
  }

// 顶部导航
  AppBar _buildAppBar() {
    return transparentAppBar(
      title: const Text(
        '组件',
        style: TextStyleUnit.appBar,
      ),
      actions: <Widget>[
        IconButton(
          icon: const Icon(
            Icons.refresh,
            color: AColors.primaryButton,
          ),
          onPressed: () {
            logic.onRefresh();
            Get.toNamed(AppRoutes.search);
          },
        )
      ],
    );
  }
}

//
// class FlutterPage extends StatefulWidget {
//   const FlutterPage({Key? key}) : super(key: key);
//
//   @override
//   _FlutterPageState createState() => _FlutterPageState();
// }
//
// class _FlutterPageState extends State<FlutterPage> {
//   final logic = Get.put(FlutterLogic());
//   final state = Get.find<FlutterLogic>().state;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AColors.primaryBackground,
//       appBar: _buildAppBar(),
//       floatingActionButton: FloatingActionButton(
//         onPressed: logic.onTop,
//         child: const Icon(Icons.vertical_align_top),
//       ),
//       body: GetX<FlutterLogic>(
//         init: logic,
//         initState: (_) {},
//         builder: (logic) {
//           return SmartRefresher(
//             controller: logic.refreshController,
//             onRefresh: logic.onRefresh,
//             enablePullUp: false,
//             enablePullDown: true,
//             child: ListView(
//               controller: logic.scrollController,
//               children: logic.state.dataList
//                   .map((element) => widgetItem(element))
//                   .toList(),
//             ),
//           );
//         },
//       ),
//     );
//   }
//
//   Widget widgetItem(WidgetsVo item) {
//     return Padding(
//       padding: const EdgeInsets.only(
//         bottom: 10,
//         top: 2,
//         left: 10,
//         right: 10,
//       ),
//       child: InkWell(
//         onTap: () => {Get.toNamed(AppRoutes.widget_detail, arguments: item.id)},
//         child: TechnoWidgetListItem(data: item),
//       ),
//     );
//   }
//
// // 顶部导航
//   AppBar _buildAppBar() {
//     return transparentAppBar(
//       title: const Text(
//         '组件',
//         style: TextStyleUnit.appBar,
//       ),
//       actions: <Widget>[
//         IconButton(
//           icon: const Icon(
//             Icons.refresh,
//             color: AColors.primaryButton,
//           ),
//           onPressed: () {
//             logic.onRefresh();
//           },
//         )
//       ],
//     );
//   }
// }
