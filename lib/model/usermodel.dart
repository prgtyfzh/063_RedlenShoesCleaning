import 'dart:convert';

class UserModel {
  String id;
  String email;
  String role;
  UserModel({
    required this.id,
    required this.email,
    required this.role,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'role': role,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ?? '',
      email: map['email'] ?? '',
      role: map['role'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
