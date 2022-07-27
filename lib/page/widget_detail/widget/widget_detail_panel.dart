import 'package:flutter/material.dart';
import 'package:flutter_star/flutter_star.dart';
import 'package:flutter_unit/common/entities/entities.dart';
import 'package:flutter_unit/common/style/style.dart';
import 'package:flutter_unit/common/values/dimens.dart';
import 'package:flutter_unit/page/widget_detail/widget/panel.dart';
import 'package:get/get.dart';

import '../../../common/values/values.dart';

class WidgetDetailPanel extends StatelessWidget {
  final WidgetsVo model;

  const WidgetDetailPanel({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            _buildLeft(model),
            _buildRight(model),
          ],
        ),
        const Divider(),
      ],
    );
  }

  Widget _buildLeft(WidgetsVo model) => Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                top: Dimens.margin,
                left: Dimens.margin,
              ),
              child: Text(
                model.nameCN.toString(),
                style: TextStyleUnit.widgetDetailTitle(model.deprecated == 1),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: Dimens.margin,
                left: Dimens.margin,
              ),
              child: Text(
                model.info.toString(),
                style: TextStyleUnit.widgetItemInfo(model.deprecated == 1),
              ),
            )
          ],
        ),
      );

  Widget _buildRight(WidgetsVo model) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 100,
            child: Padding(
              padding: const EdgeInsets.only(
                top: Dimens.margin,
                right: Dimens.margin,
              ),
              child: Hero(
                tag: "hero_widget_image_${model.widgetId}",
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  child: model.image == null
                      ? Image.asset('assets/images/caver.webp')
                      : Image(image: model.image!),
                ),
              ),
            ),
          ),
          StarScore(
            score: model.lever!.toDouble(),
            star: const Star(
              emptyColor: Colors.white,
              size: 15,
              fillColor: AColors.red,
            ),
          )
        ],
      );
}
