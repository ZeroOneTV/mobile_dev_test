import 'dart:convert';
import 'package:mobile_dev_test/Strings.dart';
import 'package:mobile_dev_test/models/Covers.dart';
import 'package:mobile_dev_test/models/Game.dart';
import 'package:mobile_dev_test/models/Genre.dart';
import 'package:mobile_dev_test/models/Platform.dart';
import 'package:http/http.dart' as http;

class RequestsHTTP {

  static Future<List<Game>> getGames() async{
    try{
      final response = await http.post(Strings.mainURL,headers: {Strings.headerKey: Strings.headerValue},body: Strings.findGame);
      if(response.statusCode == 200){
        List<Game> gamesMaped = parseGame(response.body);
        return gamesMaped;
      }else{
        throw Exception("Error");
      }
    }catch(e){
      throw Exception(e.toString());
    }
  }

  static Future<List<Genre>> getGenre() async {
        try{
            final response = await http.post(Strings.mainURL,headers: {Strings.headerKey: Strings.headerValue},body: Strings.findGenre);
            if(response.statusCode == 200){
            List<Genre> gamesGenre = parseGenre(response.body);
            return gamesGenre;
            } else{
              throw Exception("Error");
            }
        }catch(e){
            throw Exception(e.toString());
        }
}

  static Future<List<Platform>> getPlatform() async{
    try{
      final response = await http.post(Strings.mainURL,headers: {Strings.headerKey: Strings.headerValue},body: Strings.findPlatform);
      if(response.statusCode == 200){
        List<Platform> gamesPlatform = parsePlatform(response.body);
        return gamesPlatform;
      }else{
        throw Exception("Error");
      }
    }catch(e){
      throw Exception(e.toString());
    }
  }

  static Future<List<Covers>> getCovers() async{
    try{
      final response = await http.post(Strings.mainURL,headers: {Strings.headerKey: Strings.headerValue},body: Strings.findCovers);
      if(response.statusCode == 200){
        List<Covers> gamesCovers = parseCovers(response.body);
        return gamesCovers;
      }else{
        throw Exception("Error");
      }
    }catch(e){
      throw Exception(e.toString());
    }
  }

  static List<Game> parseGame (String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Game>((json) => Game.fromJson(json)).toList();
  }

  static List<Genre> parseGenre (String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Genre>((json) => Genre.fromJson(json)).toList();
  }

  static List<Platform> parsePlatform (String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Platform>((json) => Platform.fromJson(json)).toList();
  }

  static List<Covers> parseCovers (String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Covers>((json) => Covers.fromJson(json)).toList();
  }

}

// Future<Game> getGames() async {
//   Response response = await post(Strings.game,headers: {Strings.headerKey: Strings.headerValue},body: Strings.findGame);
//   List<Game> lisGame = jsonDecode(response.body).map((element) => Game.fromJson(element)).toList();
//   print(lisGame);
//   //Game.fromJson(lisGame);
// }
