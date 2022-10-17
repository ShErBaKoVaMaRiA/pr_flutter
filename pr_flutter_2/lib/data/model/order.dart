import 'package:flutter/material.dart';
import 'package:pr_flutter_2/domain/entity/order_entity.dart';

class Order extends OrderEntity {
  late int id_order;
  final String product_id;
  final String count;
  final String final_cost;
  final DateTime user_id;
  final int status;
  final int date_sale;
  final int point_id;

  Order({
    required this.product_id,
    required this.count,
    required this.final_cost,
    required this.user_id,
    required this.status,
    required this.date_sale,
    required this.point_id,
  }) : super(
          product_id: product_id,
          count: count,
          final_cost: final_cost,
          user_id: user_id,
          status: status,
          date_sale: date_sale,
          point_id: point_id,
        );

  Map<String, dynamic> toMap() {
    return {
      'product_id': product_id,
      'count': count,
      'final_cost': final_cost,
      'user_id': user_id,
      'status': status,
      'date_sale': date_sale,
      'point_id': point_id,
    };
  }

  factory Order.toFromMap(Map<String, dynamic> json) {
    return Order(
      product_id: json['product_id'],
      count: json['count'],
      final_cost: json['final_cost'],
      user_id: json['user_id'],
      status: json['status'],
      date_sale: json['date_sale'],
      point_id: json['point_id'],
    );
  }
}
