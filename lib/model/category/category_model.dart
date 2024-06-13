class CategoryModel {
  String? name;

  CategoryModel({
    this.name,
  });

  CategoryModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson([String? uid]) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    return data;
  }
}
