import 'package:dartz/dartz.dart';
import 'package:pr_flutter_2/core/usecases/auth_use_case.dart';
import 'package:pr_flutter_2/domain/entity/role_entity.dart';
import 'package:pr_flutter_2/domain/repositories/auth_repositories.dart';

class Auth implements AuthUseCase<String, AuthParams> {
  final AuthRepositories authRepositories;
  Auth(this.authRepositories);
  @override
  Future<Either<String, RoleEnum>> singIn(AuthParams params) async {
    return await authRepositories.signIn(params.login, params.password);
  }

  @override
  Future<Either<String, bool>> singUp(AuthParams params) async {
    return await authRepositories.signUp(params.login, params.password);
  }
}

class AuthParams {
  final String login;
  final String password;

  AuthParams({
    required this.login,
    required this.password,
  });
}
