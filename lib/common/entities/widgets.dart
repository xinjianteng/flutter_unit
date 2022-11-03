import 'package:flutter/cupertino.dart';

import 'enums.dart';

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
  int? id;
  String? name;
  String? nameCN;
//  是否弃用
  int? deprecated;
  String? createdAt;
  int? family;

  String? info;
  double? lever;
  String? linkWidget;

  String? objectId;
  String? updatedAt;
  final ImageProvider? image;

  WidgetsVo({
    Key? key,
    this.id,
    this.name,
    this.nameCN,
    this.createdAt,
    this.deprecated,
    this.family,
    this.info,
    this.lever,
    this.linkWidget,
    this.objectId,
    this.updatedAt,
    this.image,
  });

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "nameCN": nameCN,
        "createdAt": createdAt,
        "deprecated": deprecated,
        "family": family,
        "info": info,
        "lever": lever,
        "linkWidget": linkWidget,
        "objectId": objectId,
        "updatedAt": updatedAt,
      };

  factory WidgetsVo.fromJson(Map<String, dynamic> json) => WidgetsVo(
        id: json["id"],
        name: json["name"],
        nameCN: json["nameCN"],
        createdAt: json["createdAt"],
        deprecated: json["deprecated"],
        family: json["family"],
        info: json["info"],
        lever: json["lever"],
        linkWidget: json["linkWidget"],
        objectId: json["objectId"],
        updatedAt: json["updatedAt"],
      );



  static convertImage(String name) {
    return name.isEmpty ? null : AssetImage(name);
  }


  static List<int> formatLinkTo(String links) {
    if (links.isEmpty) {
      return [];
    }
    if (!links.contains(',')) {
      return [int.parse(links)];
    }
    return links.split(',').map<int>((e) => int.parse(e)).toList();
  }


  static WidgetFamily toFamily(int id) {
    switch (id) {
      case 0:
        return WidgetFamily.statelessWidget;
      case 1:
        return WidgetFamily.statefulWidget;
      case 2:
        return WidgetFamily.singleChildRenderObjectWidget;
      case 3:
        return WidgetFamily.multiChildRenderObjectWidget;
      case 4:
        return WidgetFamily.sliver;
      case 5:
        return WidgetFamily.proxyWidget;
      case 6:
        return WidgetFamily.other;
      default:
        return WidgetFamily.statelessWidget;
    }
  }
}
