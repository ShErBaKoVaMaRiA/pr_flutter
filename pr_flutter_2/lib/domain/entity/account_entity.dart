import 'package:pr_flutter_2/domain/entity/role_entity.dart';

class AccountEntity {
  late int id_account;
  final String login;
  final String password;
  final RoleEnum role_id;

  AccountEntity({
    this.id_account = 0,
    required this.login,
    required this.password,
    required this.role_id,
  });
}
