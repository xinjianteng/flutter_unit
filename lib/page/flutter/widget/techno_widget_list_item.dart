import 'package:flutter/material.dart';
import 'package:flutter_star/star.dart';
import 'package:flutter_star/star_score.dart';

import 'package:flutter_unit/common/entities/entities.dart';
import 'package:flutter_unit/common/values/colors.dart';
import 'package:flutter_unit/common/values/values.dart';

import '../../../common/shape/flutter_item_shape.dart';
import '../../../common/style/style.dart';
import '../../../common/widget/widgets.dart';

class TechnoWidgetListItem extends StatelessWidget {
  final WidgetsVo data;

  const TechnoWidgetListItem({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Material(
          color: AColors.primaryBackground,
          shape: TechnoShapeBorder(color: AColors.green),
          child: Container(
            height: Dimens.getHeight(95),
            padding: const EdgeInsets.only(
              top: 10,
              left: 10,
              right: 10,
              bottom: 5,
            ),
            child: Row(
              children: <Widget>[
                Wrap(
                  spacing: 5,
                  direction: Axis.vertical,
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: <Widget>[
                    Hero(
                      tag: "hero_widget_image_${data.widgetId}",
                      child: _buildLeading(),
                    ),
                    StarScore(
                      star: const Star(
                        emptyColor: Colors.white,
                        size: 12,
                        fillColor: AColors.red,
                      ),
                      score: data.lever!.toDouble(),
                    ),
                  ],
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      _buildTitle(),
                      _buildInfo(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        // _buildCollectTag(),
      ],
    );
  }

  Widget _buildCollectTag() {
    return const Positioned(
      top: 0,
      right: 40,
      child: Opacity(
        // opacity: show ? 1.0 : 0.0,
        opacity: 1.0,
        child: SizedOverflowBox(
          alignment: Alignment.bottomCenter,
          size: Size(0, 30 - 8.0),
          child: Tag(
            color: AColors.red,
            shadowHeight: 8.0,
            size: Size(20, 30),
          ),
        ),
      ),
    );
  }

//  容器说明
  Widget _buildLeading() => Padding(
        padding: const EdgeInsets.only(
          left: 5,
          right: 5,
        ),
        child: Material(
          color: AColors.primaryBackground,
          child: CircleText(
            text: data.nameCN.toString(),
            size: 60,
            color: AColors.green,
          ),
        ),
      );

  Widget _buildTitle() {
    return Row(
      children: <Widget>[
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            data.name.toString(),
            overflow: TextOverflow.ellipsis,
            style: TextStyleUnit.widgetItemTitle(data.deprecated == 1),
          ),
        ),
      ],
    );
  }

  Widget _buildInfo() {
    return Container(
      padding: const EdgeInsets.only(left: 10),
      child: Text(
        //尾部摘要
        data.info.toString(),
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        style: TextStyleUnit.widgetItemInfo(data.deprecated == 1),
      ),
    );
  }
}
