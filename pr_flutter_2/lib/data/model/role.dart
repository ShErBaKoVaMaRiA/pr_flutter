import 'package:flutter/material.dart';
import 'package:pr_flutter_2/domain/entity/role_entity.dart';

class Role extends RoleEntity {
  late int id_role;
  final String name_role;

  Role({required this.name_role}) : super(name_role: name_role);

  Map<String, dynamic> toMap() {
    return {
      'name_role': name_role,
    };
  }

  factory Role.toFromMap(Map<String, dynamic> json) {
    return Role(name_role: json['name_role']);
  }
}
