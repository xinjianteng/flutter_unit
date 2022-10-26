/// create by 张风捷特烈 on 2020-03-25
/// contact me by email 1981462002@qq.com
/// 说明:
import 'package:flutter/material.dart';

import '../../../common/widget/widgets.dart';


class CustomButtonBar extends StatelessWidget {
  const CustomButtonBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonBar(
      alignment: MainAxisAlignment.center,
      children: <Widget>[
        RaisedButton(
            color: Colors.blue,
            child: const Text("Raised"),
            onPressed: () => DialogAbout.show(context)),
        OutlinedButton(
            child: const Text("Outlined"),
            onPressed: () => DialogAbout.show(context)),
        FlatButton(
          color: Colors.blue,
          onPressed: () => DialogAbout.show(context),
          child: const Text("Flat"),
        )
      ],
    );
  }
}

