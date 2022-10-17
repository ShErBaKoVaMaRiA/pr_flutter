import 'package:flutter/material.dart';
import 'package:pr_flutter_2/domain/entity/cart_entity.dart';

class Cart extends CartEntity {
  late int id_cart;
  final int count;
  final int product_id;
  final int user_id;

  Cart({
    required this.count,
    required this.product_id,
    required this.user_id,
  }) : super(
          count: count,
          product_id: product_id,
          user_id: user_id,
        );

  Map<String, dynamic> toMap() {
    return {
      'count': count,
      'product_id': product_id,
      'user_id': user_id,
    };
  }

  factory Cart.toFromMap(Map<String, dynamic> json) {
    return Cart(
      count: json['count'],
      product_id: json['product_id'],
      user_id: json['user_id'],
    );
  }
}
