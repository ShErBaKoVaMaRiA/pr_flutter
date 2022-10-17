import 'package:flutter/material.dart';
import 'package:pr_flutter_2/domain/entity/material_entity.dart';

class Material extends MaterialEntity {
  late int id_material;
  final String name_material;

  Material({required this.name_material}) : super(name_material: name_material);

  Map<String, dynamic> toMap() {
    return {
      'name_material': name_material,
    };
  }

  factory Material.toFromMap(Map<String, dynamic> json) {
    return Material(name_material: json['name_material']);
  }
}
