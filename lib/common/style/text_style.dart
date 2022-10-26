import 'package:flutter/material.dart';
import 'package:flutter_unit/common/values/values.dart';

///文本样式
class TextStyleUnit {
  // 标题加黑
  static const navSelect = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );

  // 标题加黑
  static const navNormal = TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 16,
  );

  // 标题加黑
  static const appBar = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 22,
    color: AColors.primaryText,
  );

//  组件列表标题
  static widgetItemTitle(bool deprecated) => TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.bold,
        decoration:
            deprecated ? TextDecoration.lineThrough : TextDecoration.none,
        decorationThickness: 2,
        color: AColors.red,
      );

  //  组件列表简介
  static widgetItemInfo(bool deprecated) => TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.normal,
        decoration:
            deprecated ? TextDecoration.lineThrough : TextDecoration.none,
        decorationThickness: 2,
      );

  //  组件详情标题简介
  static widgetDetailTitle(bool deprecated) => TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        decoration:
            deprecated ? TextDecoration.lineThrough : TextDecoration.none,
        decorationThickness: 2,
        color: AColors.red,
      );

  //  组件详情标题简介
  static const secondTitle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AColors.primaryText,
  );

  //  分类标题
  static const categoryTitle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AColors.primaryText,
  );

  //  分类简介
  static const categoryInfo = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AColors.primaryText,
  );


  //  分类简介
  static const emptyTip = TextStyle(
    fontSize: 22,
    color: AColors.yellow,
  );




  static const commonChip = TextStyle(
    fontSize: 12,
    color: Colors.white,
  );

  static const splashShadows = TextStyle(
    color: AColors.secondaryText,
    shadows: [
      Shadow(
        color: Colors.black,
        blurRadius: 1,
        offset: Offset(0.1, 0.1),
      )
    ],
    fontSize: 12,
  );

  static const deprecatedChip = TextStyle(
    fontSize: 12,
    color: Colors.white,
    decoration: TextDecoration.lineThrough,
    decorationThickness: 2,
  );

// static const lagerTextSize = 30.0;
// static const bigTextSize = 23.0;
// static const normalTextSize = 18.0;
// static const middleTextWhiteSize = 16.0;
// static const smallTextSize = 14.0;
// static const minTextSize = 12.0;
//
//
//

//
//
// static const homeTabLabelStyle=TextStyle(
//   fontSize: 16,
//   fontWeight: FontWeight.bold,
// );
//
//
//
// static const minText = TextStyle(
//   color: UnitColor.subLightTextColor,
//   fontSize: minTextSize,
// );
//
//
//
// static const smallTextWhite = TextStyle(
//   color: UnitColor.textColorWhite,
//   fontSize: smallTextSize,
// );
//
// static const shadowTextStyle = TextStyle(color: Colors.grey, shadows: [
//   Shadow(color: Colors.white, offset: Offset(.5, .5), blurRadius: .5)
// ]);
//
// static const smallText = TextStyle(
//   color: UnitColor.mainTextColor,
//   fontSize: smallTextSize,
// );
//
// static const smallTextBold = TextStyle(
//   color: UnitColor.mainTextColor,
//   fontSize: smallTextSize,
//   fontWeight: FontWeight.bold,
// );
//
// static const smallSubLightText = TextStyle(
//   color: UnitColor.subLightTextColor,
//   fontSize: smallTextSize,
// );
//
// static const smallActionLightText = TextStyle(
//   color: UnitColor.actionBlue,
//   fontSize: smallTextSize,
// );
//
// static const smallMiLightText = TextStyle(
//   color: UnitColor.miWhite,
//   fontSize: smallTextSize,
// );
//
// static const smallSubText = TextStyle(
//   color: UnitColor.subTextColor,
//   fontSize: smallTextSize,
// );
//
// static const middleText = TextStyle(
//   color: UnitColor.mainTextColor,
//   fontSize: middleTextWhiteSize,
// );
//
// static const middleTextWhite = TextStyle(
//   color: UnitColor.textColorWhite,
//   fontSize: middleTextWhiteSize,
// );
//
// static const middleSubText = TextStyle(
//   color: UnitColor.subTextColor,
//   fontSize: middleTextWhiteSize,
// );
//
// static const middleSubLightText = TextStyle(
//   color: UnitColor.subLightTextColor,
//   fontSize: middleTextWhiteSize,
// );
//
// static const middleTextBold = TextStyle(
//   color: UnitColor.mainTextColor,
//   fontSize: middleTextWhiteSize,
//   fontWeight: FontWeight.bold,
// );
//
// static const middleTextWhiteBold = TextStyle(
//   color: UnitColor.textColorWhite,
//   fontSize: middleTextWhiteSize,
//   fontWeight: FontWeight.bold,
// );
//
// static const middleSubTextBold = TextStyle(
//   color: UnitColor.subTextColor,
//   fontSize: middleTextWhiteSize,
//   fontWeight: FontWeight.bold,
// );
//
// static const normalText = TextStyle(
//   color: UnitColor.mainTextColor,
//   fontSize: normalTextSize,
// );
//
// static const normalTextBold = TextStyle(
//   color: UnitColor.mainTextColor,
//   fontSize: normalTextSize,
//   fontWeight: FontWeight.bold,
// );
//
// static const normalSubText = TextStyle(
//   color: UnitColor.subTextColor,
//   fontSize: normalTextSize,
// );
//
// static const normalTextWhite = TextStyle(
//   color: UnitColor.textColorWhite,
//   fontSize: normalTextSize,
// );
//
// static const normalTextMitWhiteBold = TextStyle(
//   color: UnitColor.miWhite,
//   fontSize: normalTextSize,
//   fontWeight: FontWeight.bold,
// );
//
// static const normalTextActionWhiteBold = TextStyle(
//   color: UnitColor.actionBlue,
//   fontSize: normalTextSize,
//   fontWeight: FontWeight.bold,
// );
//
// static const normalTextLight = TextStyle(
//   color: UnitColor.primaryLightValue,
//   fontSize: normalTextSize,
// );
//
// static const largeText = TextStyle(
//   color: UnitColor.mainTextColor,
//   fontSize: bigTextSize,
// );
//
// static const largeTextBold = TextStyle(
//   color: UnitColor.mainTextColor,
//   fontSize: bigTextSize,
//   fontWeight: FontWeight.bold,
// );
//
// static const largeTextWhite = TextStyle(
//   color: UnitColor.textColorWhite,
//   fontSize: bigTextSize,
// );
//
// static const largeTextWhiteBold = TextStyle(
//   color: UnitColor.textColorWhite,
//   fontSize: bigTextSize,
//   fontWeight: FontWeight.bold,
// );
//
// static const largeLargeTextWhite = TextStyle(
//   color: UnitColor.textColorWhite,
//   fontSize: lagerTextSize,
//   fontWeight: FontWeight.bold,
// );
//
// static const largeLargeText = TextStyle(
//   color: UnitColor.primaryValue,
//   fontSize: lagerTextSize,
//   fontWeight: FontWeight.bold,
// );
}
