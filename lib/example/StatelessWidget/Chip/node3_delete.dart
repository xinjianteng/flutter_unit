/// create by 张风捷特烈 on 2020/4/25
/// contact me by email 1981462002@qq.com
/// 说明:
import 'package:flutter/material.dart';

import '../../../common/widget/widgets.dart';

class DeleteOfChip extends StatelessWidget {
  const DeleteOfChip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: Image.asset("assets/images/icon_head.webp"),
      label: const Text("张风捷特烈"),
      padding: const EdgeInsets.all(5),
      labelPadding: const EdgeInsets.all(3),
      backgroundColor: Colors.grey.withAlpha(66),
      shadowColor: Colors.orangeAccent,
//      deleteIcon: Icon(Icons.close,size: 18),
      deleteIconColor: Colors.red,
      onDeleted: () => DialogAbout.show(context),
      elevation: 3,
    );
  }
}
