class OrderEntity {
  late int id_order;
  final String product_id;
  final String count;
  final String final_cost;
  final DateTime user_id;
  final int status;
  final int date_sale;
  final int point_id;

  OrderEntity({
    required this.product_id,
    required this.count,
    required this.final_cost,
    required this.user_id,
    required this.status,
    required this.date_sale,
    required this.point_id,
  });
}
