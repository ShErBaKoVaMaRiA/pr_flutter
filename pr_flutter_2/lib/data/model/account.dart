import 'package:flutter/material.dart';
import 'package:pr_flutter_2/domain/entity/account_entity.dart';

class Account extends AccountEntity {
  late int id_account;
  final String login;
  final String password;
  final int role_id;

  Account({
    required this.login,
    required this.password,
    required this.role_id,
  }) : super(
          login: login,
          password: password,
          role_id: role_id,
        );

  Map<String, dynamic> toMap() {
    return {
      'login': login,
      'password': password,
      'role_id': role_id,
    };
  }

  factory Account.toFromMap(Map<String, dynamic> json) {
    return Account(
      login: json['login'],
      password: json['password'],
      role_id: json['role_id'],
    );
  }
}
