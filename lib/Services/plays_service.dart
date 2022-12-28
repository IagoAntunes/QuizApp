import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Models/play_model.dart';
import '../utils/const.dart';

class PlaysService {
  Future<String> postPlay(String play) async {
    try {
      final response = await http.post(Uri.parse("$uriApi/parse/classes/Plays"),
          headers: <String, String>{
            'X-Parse-Application-Id':
                'rEe5OVkoHsWOc3igs1ofd7vvy0EqKhdStryjaKWJ',
            'X-Parse-REST-API-Key': '4Oeb8idoFeBZQ67vkS4Wi4xYsIdPcJA7uUtE55zE',
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: play);
      var res = jsonDecode(response.body);
      return 'teste';
    } catch (e) {
      return 'Falha ao Enviar';
    }
  }
}
