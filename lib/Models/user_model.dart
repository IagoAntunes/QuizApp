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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'objectId': objectId,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'username': username,
      'email': email,
      'linkAvatar': linkAvatar,
      'points': points,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      objectId: map['objectId'] as String,
      createdAt: map['createdAt'] as String,
      updatedAt: map['updatedAt'] as String,
      username: map['username'] as String,
      email: map['email'] ?? "",
      linkAvatar: map['linkAvatar'] as String,
      points: map['points'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);
}
