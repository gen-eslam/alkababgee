class TableModel {
  String name;
  int capacity;
  String status;

  TableModel({
    required this.name,
    required this.capacity,
    this.status = 'free', // free or occupied or reserved
  });

  factory TableModel.fromJson(Map<String, dynamic> json, [String? docId]) {
    return TableModel(
      name: json['name'],
      capacity: json['capacity'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['capacity'] = capacity;
    data['status'] = status;
    return data;
  }

  @override
  String toString() {
    return 'TableModel(name: $name, capacity: $capacity, status: $status)';
  }
}
