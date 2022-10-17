import 'package:flutter/material.dart';
import 'package:pr_flutter_2/domain/entity/user_entity.dart';

class User extends UserEntity {
  late int id_user;
  final String surname;
  final String name;
  final String middlename;
  final DateTime datebirthday;
  final int discount;
  final int account_id;

  User({
    required this.surname,
    required this.name,
    required this.middlename,
    required this.datebirthday,
    required this.discount,
    required this.account_id,
  }) : super(
          surname: surname,
          name: name,
          middlename: middlename,
          datebirthday: datebirthday,
          discount: discount,
          account_id: account_id,
        );

  Map<String, dynamic> toMap() {
    return {
      'surname': surname,
      'name': name,
      'middlename': middlename,
      'datebirthday': datebirthday,
      'discount': discount,
      'account_id': account_id,
    };
  }

  factory User.toFromMap(Map<String, dynamic> json) {
    return User(
      surname: json['surname'],
      name: json['name'],
      middlename: json['middlename'],
      datebirthday: json['datebirthday'],
      discount: json['discount'],
      account_id: json['account_id'],
    );
  }
}
