class RoleEntity {
  late int id_role;
  final String name_role;

  RoleEntity({
    required this.name_role,
  });
}

enum RoleEnum { admin, user }
