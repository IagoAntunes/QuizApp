// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
  String objectId;
  String createdAt;
  String updatedAt;
  String username;
  String email;
  String linkAvatar;
  int points;
  User({
    required this.objectId,
    required this.createdAt,
    required this.updatedAt,
    required this.username,
    required this.email,
    required this.linkAvatar,
    required this.points,
  });

  Map<String, dynamic> toMap({required}) {
    return <String, dynamic>{
      'objectId': objectId,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'username': username,
      'email': email,
      'linkAvatar': linkAvatar,
      'points': points,
      '__type': "Pointer",
      'className': "_User",
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      objectId: map['objectId'] as String,
      createdAt: map['createdAt'] ?? '',
      updatedAt: map['updatedAt'] ?? '',
      username: map['username'] ?? '',
      email: map['email'] ?? "",
      linkAvatar: map['linkAvatar'] ?? '',
      points: map['points'] ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);
}
