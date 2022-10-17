class ProductEntity {
  late int id_product;
  final String name;
  final double price;
  final String sizes;
  final int count;
  final int material_id;
  final int type_id;

  ProductEntity({
    required this.name,
    required this.price,
    required this.sizes,
    required this.count,
    required this.material_id,
    required this.type_id,
  });
}
