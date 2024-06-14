class TableModel {
  final String name;
  final int capacity;
  final String status;

  TableModel({
    required this.name,
    required this.capacity,
    this.status = 'free', // free or occupied or reserved
  });

  factory TableModel.fromJson(Map<String, dynamic> json,[String? docId]) {
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

class TableReservationModel {
  final String name;
  final int capacity;
  final String uid;
  final String userName;
  final String email;

  TableReservationModel({
    required this.name,
    required this.capacity,
    required this.uid,
    required this.userName,
    required this.email,
  });

  factory TableReservationModel.fromJson(Map<String, dynamic> json) {
    return TableReservationModel(
      name: json['name'],
      capacity: json['capacity'],
      uid: json['uid'],
      userName: json['userName'],
      email: json['email'],
    );
  }
  // copy with
  TableReservationModel copyWith({
    String? name,
    int? capacity,
    String? status,
    String? uid,
    String? userName,
    String? email,
  }) {
    return TableReservationModel(
      name: name ?? this.name,
      capacity: capacity ?? this.capacity,
      uid: uid ?? this.uid,
      userName: userName ?? this.userName,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['capacity'] = capacity;
    data['uid'] = uid;
    data['userName'] = userName;
    data['email'] = email;
    return data;
  }
}
