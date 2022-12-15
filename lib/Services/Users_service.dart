import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quizapp/utils/const.dart';

import '../Models/User_model.dart';

class UsersService {
  Future<List<User>> getUsers() async {
    try {
      final response = await http.get(
        Uri.parse("$uriApi/parse/classes/_User"),
        headers: <String, String>{
          'X-Parse-Application-Id': 'rEe5OVkoHsWOc3igs1ofd7vvy0EqKhdStryjaKWJ',
          'X-Parse-REST-API-Key': '4Oeb8idoFeBZQ67vkS4Wi4xYsIdPcJA7uUtE55zE',
        },
      );
      List<User> listUsers = [];
      var res = jsonDecode(response.body);
      for (var user in res['results']) {
        Map<String, dynamic> map = {
          "username": user['username'] as String,
          "objectId": user['objectId'] as String,
          "createdAt": user['createdAt'] as String,
          "updatedAt": user['updatedAt'] as String,
          "points": user['points'] as int,
        };
        listUsers.add(User.fromMap(map));
      }
      return listUsers;
    } catch (e) {
      return [];
    }
  }
}
