import 'package:dartz/dartz.dart';
import 'package:pr_flutter_2/domain/entity/role_entity.dart';

abstract class AuthUseCase<Type, Params> {
  Future<Either<String, RoleEnum>> singIn(Params params);
  Future<Either<String, bool>> singUp(Params params);
}
