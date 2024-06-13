class FoodModel {
  String name;
  String image;
  num price;
  num rating;
  num quantity;
  String description;
  String category;
  num mins;

  FoodModel(
      {required this.name,
      required this.image,
      required this.price,
      required this.rating,
      required this.description,
      required this.category,
      this.quantity = 0,
      required this.mins});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['image'] = image;
    data['price'] = price;
    data['description'] = description;
    data['rating'] = rating;
    data['mins'] = mins;
    data['category'] = category;
    return data;
  }

  factory FoodModel.fromJson(Map<String, dynamic> json) {
    return FoodModel(
      name: json['name'],
      image: json['image'],
      price: json['price'],
      rating: json['rating'],
      mins: json['mins'],
      description: json['description'],
      category: json['category'],
    );
  }
}