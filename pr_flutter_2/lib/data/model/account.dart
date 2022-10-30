import 'package:flutter/material.dart';
import 'package:pr_flutter_2/domain/entity/account_entity.dart';
import 'package:pr_flutter_2/domain/entity/role_entity.dart';

class Account extends AccountEntity {
  late int id_account;

  Account({
    super.id_account = 0,
    required super.login,
    required super.password,
    required super.role_id,
  });

  Map<String, dynamic> toMap() {
    return {
      'login': login,
      'password': password,
      'role_id': role_id.id_role,
    };
  }

  factory Account.toFromMap(Map<String, dynamic> json) {
    return Account(
        id_account: json['id_account'] as int,
        login: json['login'],
        password: json['password'],
        role_id: RoleEnum.values.firstWhere(
            (element) => element.id_role == (json['role_id'] as int)));
  }
}
