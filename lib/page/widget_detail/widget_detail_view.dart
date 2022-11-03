import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_unit/common/entities/entities.dart';
import 'package:flutter_unit/common/values/colors.dart';
import 'package:flutter_unit/common/values/dimens.dart';
import 'package:flutter_unit/common/widget/widgets.dart';
import 'package:flutter_unit/example/example_map.dart';
import 'package:flutter_unit/page/widget_detail/widget_detail_state.dart';
import 'package:get/get.dart';

import '../../common/routers/names.dart';
import '../../common/style/style.dart';
import 'widget/code/highlighter_style.dart';
import 'widget/widget_detail_panel.dart';
import 'widget/widget_node_panel.dart';
import 'widget_detail_logic.dart';

class WidgetDetailPage extends StatelessWidget {
  const WidgetDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(WidgetDetailLogic());
    final state = Get.find<WidgetDetailLogic>().state;
    return Scaffold(
      appBar: _buildAppBar(state),
      body: _buildBody(logic, state),
    );
  }

// 顶部导航
  AppBar _buildAppBar(WidgetDetailState state) {
    return transparentAppBar(
      title: Obx(() {
        return Text(
          state.widgetVo.value.name.toString(),
          style: TextStyleUnit.appBar,
        );
      }),
      actions: <Widget>[
        IconButton(
          icon: const Icon(
            Icons.home,
            color: AColors.primaryButton,
          ),
          onPressed: () {
            Get.back();
          },
        )
      ],
    );
  }

  //内容
  _buildBody(WidgetDetailLogic logic, WidgetDetailState state) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Obx(() {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                WidgetDetailPanel(model: state.widgetVo.value),
                linkText,
                _buildLinkTo(logic, state),
                const Divider(),
              ],
            );
          }),
        ),
        _buildSliverNodeList(logic, state)
      ],
    );
  }

  Widget get linkText => Row(
        children:  [
          const Padding(
            padding: EdgeInsets.only(
              left: Dimens.margin,
              right: 5,
            ),
            child: Icon(
              Icons.link,
              color: Colors.blue,
            ),
          ),
          Text('相关组件', style: TextStyleUnit.secondTitle),
        ],
      );

  Widget _buildLinkTo(WidgetDetailLogic logic, WidgetDetailState state) {
    if (state.linkWidgets.isEmpty) {
      return Padding(
        padding: const EdgeInsets.only(left: Dimens.margin),
        child: Chip(
          backgroundColor: Colors.grey.withAlpha(120),
          labelStyle: const TextStyle(fontSize: 12, color: Colors.white),
          label: const Text('暂无链接组件'),
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.only(
          left: Dimens.margin,
          top: Dimens.margin,
        ),
        child: Wrap(
          spacing: 10,
          runSpacing: 10,
          children: state.linkWidgets
              .map((WidgetsVo model) => ActionChip(
                    onPressed: () => {
                      Get.toNamed(AppRoutes.widget_detail,
                          arguments: json.encode(model.toJson()))
                    },
                    elevation: 2,
                    shadowColor: AColors.primaryBackground,
                    backgroundColor: AColors.primaryButton,
                    labelStyle: int.parse(model.deprecated.toString()) == 1
                        ? TextStyleUnit.deprecatedChip
                        : TextStyleUnit.commonChip,
                    label: Text(model.name.toString()),
                  ))
              .toList(),
        ),
      );
    }
  }

  _buildSliverNodeList(WidgetDetailLogic logic, WidgetDetailState state) {
    HighlighterStyle codeStyle =
        HighlighterStyle.codeThemeSupport.keys.toList()[1];
    return Obx(() {
      return SliverList(
        delegate: SliverChildBuilderDelegate(
          (_, i) => WidgetNodePanel(
            codeStyle: codeStyle,
            codeFamily: 'Inconsolata',
            text: state.nodeVo[i].name.toString(),
            subText: state.nodeVo[i].subtitle.toString(),
            code: state.nodeVo[i].code.toString(),
            show: ExampleMap.map(state.widgetVo.value.name)[i],
          ),
          childCount: state.nodeVo.length,
        ),
      );
    });
  }
}
