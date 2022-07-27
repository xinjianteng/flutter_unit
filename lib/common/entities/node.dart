import 'package:flutter/cupertino.dart';
import 'package:flutter_unit/common/entities/entities.dart';

class NodePageListRequestEntity {
  String? where;
  String? order;

  NodePageListRequestEntity({
    Key? key,
    this.where,
    this.order,
  });

  Map<String, dynamic> toJson() => {
        "where": where,
        "order": order,
      };
}

/// 组件分页 response
class NodePageListResponseEntity {
  List<NodeModel>? results;

  NodePageListResponseEntity({
    Key? key,
    this.results,
  });

  factory NodePageListResponseEntity.fromJson(Map<String, dynamic> json) =>
      NodePageListResponseEntity(
        results: json["results"] == null
            ? []
            : List<NodeModel>.from(
                json["results"].map((x) => NodeModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "results": results == null
            ? []
            : List<dynamic>.from(results!.map((x) => x.toJson())),
      };
}

class NodeModel {
  String? name;
  String? subtitle;
  String? code;
  String? createdAt;
  int? id;
  String? objectId;
//  优先
  int? priority;
  String? updatedAt;
  int? widgetId;

  NodeModel({
    Key? key,
    this.name,
    this.subtitle,
    this.code,
    this.createdAt,
    this.id,
    this.objectId,
    this.priority,
    this.updatedAt,
    this.widgetId,
  });

  factory NodeModel.fromJson(Map<String, dynamic> map) {
    return NodeModel(
      name: map['name'],
      subtitle: map["subtitle"],
      code: map["code"],
      createdAt: map["createdAt"],
      id: map["id"],
      objectId: map["objectId"],
      priority: map["priority"],
      updatedAt: map["updatedAt"],
      widgetId: map["widgetId"],
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "subtitle": subtitle,
        "code": code,
        "createdAt": createdAt,
        "id": id,
        "objectId": objectId,
        "priority": priority,
        "updatedAt": updatedAt,
        "widgetId": widgetId,
      };
}
