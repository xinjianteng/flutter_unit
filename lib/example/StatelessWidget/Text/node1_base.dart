import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle style = const TextStyle(
      color: Colors.red,
      fontSize: 20,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.italic,
      letterSpacing: 10,
    );
    return Container(
      width: 400,
      color: Colors.cyanAccent.withAlpha(33),
      child: Text(
        "示例文本\n乐不可极，极乐成哀；欲不可纵，纵欲成灾。",
        style: style,
        textAlign: TextAlign.center,
      ),
    );
  }
}
