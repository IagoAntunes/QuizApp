import 'dart:convert';

class User {
  String className;
  String objectId;
  String createdAt;
  String updatedAt;
  String username;
  String email;
  String sessionToken;
  int points;
  User({
    required this.className,
    required this.objectId,
    required this.createdAt,
    required this.updatedAt,
    required this.username,
    required this.email,
    required this.sessionToken,
    required this.points,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'className': className,
      'objectId': objectId,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'username': username,
      'email': email,
      'sessionToken': sessionToken,
      'points': points,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      className: map['className'] ?? "",
      objectId: map['objectId'] as String,
      createdAt: map['createdAt'] as String,
      updatedAt: map['updatedAt'] as String,
      username: map['username'] as String,
      email: map['email'] ?? '',
      sessionToken: map['sessionToken'] ?? '',
      points: map['points'] ?? 1,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);
}
