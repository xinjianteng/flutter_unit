
import 'package:flutter/material.dart';

class AColors {

  static const Color green = Color(0xff5eb670);
  static const Color yellow = Color(0xfff4a124);
  static const Color blue = Color(0xff2cb0ff);
  static const Color red = Color(0xffe63564);


  /// 主背景 白色
  static const Color primaryBackground = Color(0xffffffff);
  /// 主控件-背景 蓝色
  static const Color primaryButton =blue;
  /// 主文本 灰色
  static const Color primaryText = Color(0xff232323);

  /// 次背景 白色
  static const Color secondBackground = Color(0xffF6FBF4);
  /// 次要文本颜色
  static const Color secondaryText = Color(0xFF74788D);


  /// nav 选中颜色 蓝色
  static const Color navSelect = blue;
  /// nav 默认颜色 灰色
  static const Color navNormal =  Color(0xff959595);

  /// nav 默认颜色 灰色
  static const Color divider =  Color(0xff959595);





  // *****************************************


  /// 高亮颜色
  static const Color accentColor = Color(0xFF5C78FF);

  /// 次要颜色
  static const Color secondaryColor = Color(0xFFDEE3FF);

  /// 警告颜色
  static const Color warnColor = Color(0xFFFFB822);

  /// 边框颜色
  static const Color borderColor = Color(0xFFDEE3FF);

  static const Color pinkColor = Color(0xFFF77866);

  static const Color yellowColor = Color(0xFFFFB822);

  static const List<Color> tabColors = [
    Color(0xff44D1FD),
    Color(0xffFD4F43),
    Color(0xffB375FF),
    Color(0xFF4CAF50),
    Color(0xFFFF9800),
    Color(0xFF00F1F1),
    Color(0xFFDBD83F),
  ];


  static const collectColorSupport = <Color>[
    Color(0xFFF2F2F2),
    Colors.black,
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.indigo,
    Colors.purple,

    Colors.cyanAccent,
    Color(0xffd1d08f),
    Colors.pink,
    Colors.amber,
    Colors.lime,
    Colors.teal,
    Colors.cyan,
    Color(0xff586CF2),
    Colors.purpleAccent,
  ];

  static const int primaryIntValue = 0xFF24292E;

  static const MaterialColor primarySwatch = MaterialColor(
    primaryIntValue,
    <int, Color>{
      50: Color(primaryIntValue),
      100: Color(primaryIntValue),
      200: Color(primaryIntValue),
      300: Color(primaryIntValue),
      400: Color(primaryIntValue),
      500: Color(primaryIntValue),
      600: Color(primaryIntValue),
      700: Color(primaryIntValue),
      800: Color(primaryIntValue),
      900: Color(primaryIntValue),
    },
  );

  static const String primaryValueString = "#24292E";
  static const String primaryLightValueString = "#42464b";
  static const String primaryDarkValueString = "#121917";
  static const String miWhiteString = "#ececec";
  static const String actionBlueString = "#267aff";
  static const String webDraculaBackgroundColorString = "#282a36";

  static const Color primaryValue = Color(0xFF24292E);
  static const Color primaryLightValue = Color(0xFF42464b);
  static const Color primaryDarkValue = Color(0xFF121917);

  static const Color cardWhite = Color(0xFFFFFFFF);
  static const Color textWhite = Color(0xFFFFFFFF);
  static const Color miWhite = Color(0xffececec);
  static const Color white = Color(0xFFFFFFFF);
  static const Color actionBlue = Color(0xff267aff);
  static const Color subTextColor = Color(0xff959595);
  static const Color subLightTextColor = Color(0xffc4c4c4);

  static const Color mainBackgroundColor = miWhite;

  static const Color mainTextColor = primaryDarkValue;
  static const Color textColorWhite = white;

}
