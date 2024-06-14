class OrderModel {
  final String name;
  final String image;
  final num price;
  final num quantity;
  final num total;
  final String orderId;
  final String orderStatus;
  final String uid;
  OrderModel({
    required this.name,
    required this.image,
    required this.price,
    required this.quantity,
    required this.total,
    required this.uid,
    this.orderId = "56247",
    this.orderStatus = "pending",
  });
  factory OrderModel.fromJson(Map<String, dynamic> json,[String? docId]) {
    return OrderModel(
      name: json['name'],
      image: json['image'],
      price: json['price'],
      quantity: json['quantity'],
      total: json['total'],
      orderId: json['orderId'],
      orderStatus: json['orderStatus'],
      uid: json['uid'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['image'] = image;
    data['price'] = price;
    data['quantity'] = quantity;
    data['total'] = total;
    data['orderId'] = orderId;
    data['orderStatus'] = orderStatus;
    data['uid'] = uid;
    return data;
  }
}
