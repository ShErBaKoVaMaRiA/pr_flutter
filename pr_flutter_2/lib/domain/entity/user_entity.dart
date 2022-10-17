class UserEntity {
  late int id_user;
  final String surname;
  final String name;
  final String middlename;
  final DateTime datebirthday;
  final int discount;
  final int account_id;

  UserEntity({
    required this.surname,
    required this.name,
    required this.middlename,
    required this.datebirthday,
    required this.discount,
    required this.account_id,
  });
}
