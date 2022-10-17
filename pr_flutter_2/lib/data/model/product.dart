import 'package:flutter/material.dart';
import 'package:pr_flutter_2/domain/entity/product_entity.dart';

class Product extends ProductEntity {
  late int id_product;
  final String name;
  final double price;
  final String sizes;
  final int count;
  final int material_id;
  final int type_id;

  Product({
    required this.name,
    required this.price,
    required this.sizes,
    required this.count,
    required this.material_id,
    required this.type_id,
  }) : super(
          name: name,
          price: price,
          sizes: sizes,
          count: count,
          material_id: material_id,
          type_id: type_id,
        );

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
      'sizes': sizes,
      'count': count,
      'material_id': material_id,
      'type_id': type_id,
    };
  }

  factory Product.toFromMap(Map<String, dynamic> json) {
    return Product(
      name: json['name'],
      price: json['price'],
      sizes: json['sizes'],
      count: json['count'],
      material_id: json['material_id'],
      type_id: json['type_id'],
    );
  }
}
