import 'package:flutter/material.dart';
import 'package:pr_flutter_2/domain/entity/point_issue_entity.dart';

class Point_Issue extends Point_IssueEntity {
  late int id_point;
  final String address;
  final String shedule_work;

  Point_Issue({required this.address, required this.shedule_work})
      : super(address: address, shedule_work: shedule_work);

  Map<String, dynamic> toMap() {
    return {
      'address': address,
      'shedule_work': shedule_work,
    };
  }

  factory Point_Issue.toFromMap(Map<String, dynamic> json) {
    return Point_Issue(
        address: json['address'], shedule_work: json['shedule_work']);
  }
}
