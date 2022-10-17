class AccountEntity {
  late int id_account;
  final String login;
  final String password;
  final int role_id;

  AccountEntity({
    required this.login,
    required this.password,
    required this.role_id,
  });
}
