import 'package:flutter/material.dart';
import 'package:flutter_unit/common/values/colors.dart';

/// 透明背景 AppBar
AppBar transparentAppBar({
  Widget? title,
  Widget? leading,
  List<Widget>? actions,
}) {
  return AppBar(
    backgroundColor: AColors.primaryBackground,
    elevation: 0.2,
    title: title,
    leading: leading,
    actions: actions,
  );
}
