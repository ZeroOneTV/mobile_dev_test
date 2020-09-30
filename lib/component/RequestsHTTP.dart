import 'dart:convert';
import 'package:mobile_dev_test/Strings.dart';
import 'package:mobile_dev_test/models/Covers.dart';
import 'package:mobile_dev_test/models/Game.dart';
import 'package:mobile_dev_test/models/GameCover.dart';
import 'package:mobile_dev_test/models/Genre.dart';
import 'package:mobile_dev_test/models/Platform.dart';
import 'package:http/http.dart' as http;

class RequestsHTTP {

  static Future<List<Game>> getGames() async{
    try{
      var response = await http.post(Strings.game,headers: {Strings.headerClientID: Strings.headerClientIDValue,
        Strings.headerAuthorization: Strings.headerAuthorizationValue},body: Strings.findGame);
      if(response.statusCode == 200) {
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
            final response = await http.post(Strings.genres,headers: {Strings.headerClientID: Strings.headerClientIDValue,
              Strings.headerAuthorization: Strings.headerAuthorizationValue},body: Strings.findGenre);
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
      final response = await http.post(Strings.platform,headers: {Strings.headerClientID: Strings.headerClientIDValue,
        Strings.headerAuthorization: Strings.headerAuthorizationValue},body: Strings.findPlatform);
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
      final response = await http.post(Strings.covers,headers: {Strings.headerClientID: Strings.headerClientIDValue,
        Strings.headerAuthorization: Strings.headerAuthorizationValue},body: Strings.findCovers);
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

  static Future<List<GameCover>> getGameWithCovers() async {
    var client = http.Client();
    List<GameCover> gameCover = new List<GameCover>();
    try{
      var response1 = await client.post(Strings.game,headers: {Strings.headerClientID: Strings.headerClientIDValue,
        Strings.headerAuthorization: Strings.headerAuthorizationValue},body: Strings.findGame);
      if(response1.statusCode == 200) {
        List<Game> gamesMaped = parseGame(response1.body);
        for(int i=0; i < gamesMaped.length;){
          GameCover tempCover = new GameCover();
          if(gamesMaped[i].cover != 0){
            String id_cover = gamesMaped[i].cover.toString();
            try{
              var responseCover = await client.post(Strings.covers,headers: {Strings.headerClientID: Strings.headerClientIDValue,
                Strings.headerAuthorization: Strings.headerAuthorizationValue},body: Strings.findCovers+' '+Strings.find+' '+id_cover+';');
              if((responseCover.statusCode == 200)){
                List<Covers> covers = parseCovers(responseCover.body);
                if(covers.length != 0){
                  tempCover.id = gamesMaped[i].id;
                  tempCover.name = gamesMaped[i].name;
                  tempCover.summary = gamesMaped[i].summary;
                  tempCover.url = covers[0].url;
                  tempCover.width = covers[0].width;
                  tempCover.height = covers[0].height;
                  gameCover.add(tempCover);
                  i+=1;
               }else{
                  i+=1;
                }}else {
                throw Exception("Error");
              }
            }catch(e){
              throw Exception(e.toString());
            }
          }else{
            tempCover.id = gamesMaped[i].id;
            tempCover.name = gamesMaped[i].name;
            tempCover.summary = gamesMaped[i].summary;
            tempCover.url = Strings.fileNotFoundURL;
            gameCover.add(tempCover);
            i+=1;
          }
      }
    }else {
        throw Exception("Error");
      }
      client.close();
      return gameCover;
    }catch (e) {
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
