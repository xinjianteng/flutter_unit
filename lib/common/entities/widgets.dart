import 'package:flutter/cupertino.dart';

/// 组件分页 request
///
class WidgetsPageListRequestEntity {
  String? limit;
  String? skip;
  String? count;
  String? where;
  String? order;

  WidgetsPageListRequestEntity({
    Key? key,
    this.limit,
    this.skip,
    this.count,
    this.where,
    this.order,
  });

  Map<String, dynamic> toJson() => {
        "limit": limit,
        "skip": skip,
        "count": count,
        "where": where,
        "order": order,
      };
}

/// 组件分页 response
class WidgetPageListResponseEntity {
  List<WidgetsVo>? results;
  int count;

  WidgetPageListResponseEntity({
    required this.results,
    required this.count,
  });

  factory WidgetPageListResponseEntity.fromJson(Map<String, dynamic> json) =>
      WidgetPageListResponseEntity(
        count: json["count"],
        results: json["results"] == null
            ? []
            : List<WidgetsVo>.from(
                json["results"].map((x) => WidgetsVo.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "results": results == null
            ? []
            : List<dynamic>.from(results!.map((x) => x.toJson())),
      };
}

class WidgetsVo {
  String? createdAt;
//  是否弃用
  int? deprecated;

  String? family;
  int? widgetId;
  String? info;
  int? lever;
  String? linkWidget;
  String? name;
  String? nameCN;
  String? objectId;
  String? updatedAt;
  final ImageProvider? image;

  WidgetsVo({
    Key? key,
    this.createdAt,
    this.deprecated,
    this.family,
    this.widgetId,
    this.info,
    this.lever,
    this.linkWidget,
    this.name,
    this.nameCN,
    this.objectId,
    this.updatedAt,
    this.image,
  });

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt,
        "deprecated": deprecated,
        "family": family,
        "widgetId": widgetId,
        "info": info,
        "lever": lever,
        "linkWidget": linkWidget,
        "name": name,
        "nameCN": nameCN,
        "objectId": objectId,
        "updatedAt": updatedAt,
      };

  factory WidgetsVo.fromJson(Map<String, dynamic> json) => WidgetsVo(
        createdAt: json["createdAt"],
        deprecated: json["deprecated"],
        family: json["family"],
        widgetId: json["widgetId"],
        info: json["info"],
        lever: json["lever"],
        linkWidget: json["linkWidget"],
        nameCN: json["nameCN"],
        name: json["name"],
        objectId: json["objectId"],
        updatedAt: json["updatedAt"],
      );
}
