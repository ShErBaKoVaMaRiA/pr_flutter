import 'package:pr_flutter_2/common/data_base_request.dart';
import 'package:pr_flutter_2/core/db/data_base_helper.dart';
import 'package:pr_flutter_2/data/model/account.dart';
import 'package:pr_flutter_2/data/model/user.dart';
import 'package:pr_flutter_2/domain/entity/role_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:pr_flutter_2/domain/repositories/auth_repositories.dart';
import 'package:sqflite/sqflite.dart';

class AuthReposityImpl implements AuthRepositories {
  final _db = DataBaseHelper.instance.dataBase;
  @override
  String get table => DataBaseRequest.tableAccounts;

  @override
  Future<Either<String, RoleEnum>> signIn(String login, String password) async {
    try {
      var account =
          (await _db.query(table, where: 'login = ?', whereArgs: [login]))
              .map((e) => Account.toFromMap(e));

      if (account.isEmpty) {
        return const Left('Такого пользователя нет');
      }
      if (account.first.password != password) {
        return const Left('Неверный пароль');
      }
      return Right(account.first.role_id);
    } on DatabaseException catch (error) {
      return const Left('');
    }
  }

  @override
  Future<Either<String, bool>> signUp(String login, String password) async {
    try {
      await _db.insert(
          table,
          Account(
            login: login,
            password: password,
            role_id: RoleEnum.user,
          ).toMap());
      return const Right(true);
    } on DatabaseException catch (error) {
      return const Left('');
      print(error.result);
    }
  }
}
