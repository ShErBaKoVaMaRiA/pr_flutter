import 'package:flutter/cupertino.dart';
import 'package:pr_flutter_2/domain/entity/role_entity.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepositories {
  String get table;
//метод для авторизации
  Future<Either<String, RoleEnum>> signIn(String login, String password);
// метод для регистрации
  Future<Either<String, bool>> signUp(String login, String password);
}
