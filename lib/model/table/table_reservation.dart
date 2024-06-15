class TableReservationModel {
  String name;
  int capacity;
  String uid;
  String userName;
  String email;
  String date;
  String time;

  TableReservationModel({
    required this.name,
    required this.capacity,
    required this.uid,
    required this.userName,
    required this.date,
    required this.time,
    required this.email,
  });

  factory TableReservationModel.fromJson(Map<String, dynamic> json,
      [String? id]) {
    return TableReservationModel(
      name: json['name'],
      capacity: json['capacity'],
      date: json['date'],
      time: json['time'],
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
    String? date,
    String? time,
  }) {
    return TableReservationModel(
      name: name ?? this.name,
      capacity: capacity ?? this.capacity,
      date: date ?? this.date,
      time: time ?? this.time,
      uid: uid ?? this.uid,
      userName: userName ?? this.userName,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['capacity'] = capacity;
    data['date'] = date;
    data['time'] = time;
    data['uid'] = uid;
    data['userName'] = userName;
    data['email'] = email;
    return data;
  }
}
