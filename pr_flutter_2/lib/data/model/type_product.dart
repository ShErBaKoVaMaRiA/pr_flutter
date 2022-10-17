import 'package:flutter/material.dart';
import 'package:pr_flutter_2/domain/entity/type_product_entity.dart';

class Type_Product extends Type_ProductEntity {
  late int id_type;
  final String name_type;

  Type_Product({required this.name_type}) : super(name_type: name_type);

  Map<String, dynamic> toMap() {
    return {
      'name_type': name_type,
    };
  }

  factory Type_Product.toFromMap(Map<String, dynamic> json) {
    return Type_Product(name_type: json['name_type']);
  }
}
