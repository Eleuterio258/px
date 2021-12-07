import 'dart:convert';

class User {
  String id;
  String name;
  String email;
  String otp;
  String updatedAt;
  String createdAt;
  bool emailVerified;
  String imageProfile;
  User(
      {this.id,
      this.name,
      this.email,
      this.otp,
      this.updatedAt,
      this.createdAt,
      this.emailVerified,
      this.imageProfile});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'otp': otp,
      'updatedAt': updatedAt,
      'createdAt': createdAt,
      'emailVerified': emailVerified,
      'imageProfile': imageProfile,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      otp: map['otp'],
      updatedAt: map['updatedAt'],
      createdAt: map['createdAt'],
      emailVerified: map['emailVerified'],
      imageProfile: map['imageProfile'],
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}
