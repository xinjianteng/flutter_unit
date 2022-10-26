import 'package:flutter/material.dart';
import 'package:flutter_unit/page/empty/empty_view.dart';
import 'package:flutter_unit/page/search/search_logic.dart';
import 'package:flutter_unit/page/search/search_state.dart';
import 'package:get/get.dart';

import '../../common/entities/widgets.dart';
import '../../common/routers/names.dart';
import '../../common/values/values.dart';
import '../../common/widget/widgets.dart';
import '../flutter/widget/techno_widget_list_item.dart';
import 'multi_chip_filter.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(SearchLogic());
    final state = Get
        .find<SearchLogic>()
        .state;
    return Scaffold(
      appBar: _buildAppBar(state, logic),
      body: _buildBody(state, logic),
    );
  }

// 顶部导航
  AppBar _buildAppBar(SearchState state, SearchLogic logic) {
    return transparentAppBar(
      title: TextField(
        minLines: 1,
        maxLines: 1,
        cursorColor: Colors.green,
        cursorRadius: const Radius.circular(3),
        cursorWidth: 5,
        showCursor: true,
        decoration: const InputDecoration(
          filled: true,
          // fillColor: AColors.green,
          prefixIcon: Icon(Icons.search),
          contentPadding: EdgeInsets.all(10),
          hintText: "输入控件名称...",
          border: UnderlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(19)),
          ),
        ),
        onChanged: (v) {
          state.searchStr.value = v.toString();
          logic.search();
        },
      ),
      actions: <Widget>[
        IconButton(
          icon: const Icon(
            Icons.search,
            color: AColors.primaryButton,
          ),
          onPressed: () {
            logic.search();
          },
        )
      ],
    );
  }

  //内容
  Widget _buildBody(SearchState state, SearchLogic logic) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildStarFilter(),
              const Divider(),
              Obx(() {
                return Visibility(
                  child: const EmptyPage(message: '暂无数据'),
                  visible: state.dataList.isEmpty,
                );
              }),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                      (_, i) => widgetItem(state.dataList[i]),
                  childCount: state.dataList.length,
                ),
              ),
            ],
          ),
        ),
        // _buildSearchResult(state, logic)
      ],
    );
  }

  // Widget _buildSearchResult(SearchState state, SearchLogic logic) {
  //   return ;
  // }

  Widget _buildStarFilter() =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 20, bottom: 5),
            child: Wrap(
              spacing: 5,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: const <Widget>[
                Circle(
                  radius: 5,
                  color: Colors.orange,
                ),
                Text(
                  '星级查询',
                  style: TextStyle(
                      color: AColors.primaryText, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          MultiChipFilter<int>(
            data: const [1, 2, 3, 4, 5],
            avatarBuilder: (_, index) =>
                CircleAvatar(child: Text((index + 1).toString())),
            labelBuilder: (_, selected) =>
                Icon(
                  Icons.star,
                  color: selected ? Colors.blue : Colors.grey,
                  size: 18,
                ),
            onChange: _doSelectStart,
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          )
        ],
      );

  void _doSelectStart(List<int> select) {}

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
}
