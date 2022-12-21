import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quizapp/Models/category_model.dart';
import 'package:quizapp/utils/const.dart';

import '../Models/User_model.dart';

class CategoryService {
  Future<List<CategoryModel>> getCategories() async {
    try {
      final response = await http.get(
        Uri.parse("$uriApi/parse/classes/Category"),
        headers: <String, String>{
          'X-Parse-Application-Id': 'rEe5OVkoHsWOc3igs1ofd7vvy0EqKhdStryjaKWJ',
          'X-Parse-REST-API-Key': '4Oeb8idoFeBZQ67vkS4Wi4xYsIdPcJA7uUtE55zE',
        },
      );
      List<CategoryModel> listCategory = [];
      var res = jsonDecode(response.body);

      for (var user in res['results']) {
        Map<String, dynamic> map = {
          "objectId": user['objectId'] as String,
          "name": user['name'] as String,
          "icon": user['icon'] as String,
        };
        listCategory.add(CategoryModel.fromMap(map));
      }
      return listCategory;
    } catch (e) {
      return [];
    }
  }
}
