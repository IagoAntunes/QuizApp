import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class CategoryModel {
  String objectId;
  String name;
  String icon;
  CategoryModel({
    required this.objectId,
    required this.name,
    required this.icon,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '__type': "Pointer",
      'className': "Category",
      'objectId': objectId,
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      objectId: map['objectId'] as String,
      name: map['name'] ?? '',
      icon: map['icon'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) =>
      CategoryModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
