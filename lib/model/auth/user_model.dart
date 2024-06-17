class UserModel {
  String? uid, name, email, docId;
  
  
  UserModel({
    this.uid,
    this.name,
    this.email,
    this.docId,
  });

  factory UserModel.fromJson(Map<String, dynamic> json, [String? docId]) =>
      UserModel(
        uid: json['uid'],
        name: json['userName'],
        email: json['email'],
        docId: docId,
      );

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'userName': name,
        'email': email,
      };

  @override
  String toString() {
    return "uid: $uid, userName: $name, email: $email, docId: $docId";
  }
}

