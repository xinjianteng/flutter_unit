import 'package:flutter/material.dart';
import 'package:flutter_unit/page/search/search_logic.dart';
import 'package:get/get.dart';

import '../../common/values/values.dart';
import '../../common/widget/widgets.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final logic = Get.put(SearchLogic());
  final state = Get.find<SearchLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Text('ssss'),
    );
  }

// 顶部导航
  AppBar _buildAppBar() {
    return transparentAppBar(
      title: TextField(
        style: TextStyle(color: Colors.blue),
        minLines: 1,
        maxLines: 1,
        cursorColor: Colors.green,
        cursorRadius: Radius.circular(3),
        cursorWidth: 5,
        showCursor: true,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.all(10),
          hintText: "请输入手机号...",
          border: OutlineInputBorder(),
        ),
        onChanged: (v) {
          state.searchStr.value = v.toString();
        },
      ),
      actions: <Widget>[
        IconButton(
          icon: const Icon(
            Icons.search,
            color: AColors.primaryButton,
          ),
          onPressed: () {
            // logic.onRefresh();
          },
        )
      ],
    );
  }
}
