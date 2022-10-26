import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../common/entities/entities.dart';
import '../../common/style/style.dart';
import '../../common/utils/utils.dart';
import '../../common/values/values.dart';
import '../../common/widget/widgets.dart';
import 'category_logic.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  final logic = Get.put(CategoryLogic());
  final state = Get.find<CategoryLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AColors.primaryBackground,
      appBar: _buildAppBar(),
      body: GetX<CategoryLogic>(
        init: logic,
        initState: (_) {},
        builder: (logic) {
          return SmartRefresher(
            controller: logic.refreshController,
            onRefresh: logic.onRefresh,
            enablePullUp: false,
            enablePullDown: true,
            child: GridView.builder(
              physics: const ClampingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                //网格代理：定交叉轴数目
                crossAxisCount: 2, //条目个数
                mainAxisSpacing: Dimens.margin, //主轴间距
                crossAxisSpacing: Dimens.margin, //交叉轴间距
                // childAspectRatio: 1 / 0.718,
              ),
              itemBuilder: (c, i) => _buildItem(
                logic.state.categoryList[i],
              ),
              itemCount: logic.state.categoryList.length,
            ),
          );
        },
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
          },
        )
      ],
    );
  }

  Widget _buildItem(CategoryVo element) {
    return Material(
      shadowColor: ColorUtils.parse(element.color.toString()),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          children: [
            _buildTitle(element),
            const Divider(),
            Container(
              padding: const EdgeInsets.all(10),
              child: Text(
                element.info.toString(),
                style: TextStyleUnit.categoryInfo,
              ),
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }

  Row _buildTitle(CategoryVo element) {
    return Row(
      children: <Widget>[
        CircleText(
          text: "${element.count}",
          size: 35,
          fontSize: 14,
          backgroundColor: ColorUtils.parse(element.color),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Text(
            element.name.toString(),
            style: TextStyleUnit.categoryTitle,
          ),
        ),
      ],
    );
  }
}
