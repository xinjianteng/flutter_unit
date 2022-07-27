import 'package:flutter/cupertino.dart';

/// 组件分页 request
///
class CategoryPageListRequestEntity {
  String? limit;
  String? skip;
  String? count;
  String? where;
  String? order;

  CategoryPageListRequestEntity({
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
class CategoryPageListResponseEntity {
  List<CategoryVo>? results;
  int count;

  CategoryPageListResponseEntity({
    required this.results,
    required this.count,
  });

  factory CategoryPageListResponseEntity.fromJson(Map<String, dynamic> json) =>
      CategoryPageListResponseEntity(
        count: json["count"],
        results: json["results"] == null
            ? []
            : List<CategoryVo>.from(
                json["results"].map((x) => CategoryVo.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "results": results == null
            ? []
            : List<dynamic>.from(results!.map((x) => x.toJson())),
      };
}

class CategoryVo {
  final int? categoryId;
  final String? name;
  final String? info;
  final String? updatedAt;
  String color;
  int count = 10;

  CategoryVo({
    Key? key,
    required this.categoryId,
    required this.updatedAt,
    this.name,
    this.info,
    required this.color,
    required this.count,
  });

  Map<String, dynamic> toJson() => {
        "categoryId": categoryId,
        "updatedAt": updatedAt,
        "name": name,
        "info": info,
        "lever": color,
      };

  factory CategoryVo.fromJson(Map<String, dynamic> json) => CategoryVo(
        categoryId: json["categoryId"],
        name: json["name"],
        updatedAt: json["updatedAt"],
        info: json["info"],
        color: json["color"],
        count: 10,
      );
}
