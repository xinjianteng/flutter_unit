/// create by 张风捷特烈 on 2020-03-26
/// contact me by email 1981462002@qq.com
/// 说明:
import 'package:flutter/material.dart';

class CustomFlatButton extends StatelessWidget {
  const CustomFlatButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: ()=>{},
      padding: const EdgeInsets.all(8),
      splashColor: Colors.green,
      child: const Text("FlatButton"),
      textColor: const Color(0xffFfffff),
      color: Colors.blue,
      highlightColor: const Color(0xffF88B0A),
    );
  }
}
