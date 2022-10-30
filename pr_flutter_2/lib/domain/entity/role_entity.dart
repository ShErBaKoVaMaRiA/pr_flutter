class RoleEntity {
  late int id_role;
  final String name_role;

  RoleEntity({
    required this.name_role,
  });
}

enum RoleEnum {
  admin(id_role: 1, name_role: 'Администратор'),
  user(id_role: 2, name_role: 'Пользователь');

  const RoleEnum({
    required this.id_role,
    required this.name_role,
  });
  final String name_role;
  final int id_role;
}
