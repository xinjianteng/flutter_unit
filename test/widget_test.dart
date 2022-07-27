import 'package:flutter/material.dart';
class CustomCircleAvatar extends StatelessWidget {
  const CustomCircleAvatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 50,
      backgroundImage: AssetImage("assets/images/wy_200x300.webp"),
      foregroundColor: Colors.white,
      child: Icon(
        Icons.check,
        size: 50,
      ),
    );
  }
}
