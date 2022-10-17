class CartEntity {
  late int id_cart;
  final int count;
  final int product_id;
  final int user_id;

  CartEntity({
    required this.count,
    required this.product_id,
    required this.user_id,
  });
}
