class Game {
   int id;
   int cover;
   List<int> genres;
   String name;
   String summary;

   Game({this.id, this.cover, this.genres, this.name, this.summary});

   factory Game.fromJson(Map <String, dynamic> json){
     return Game(
        id : json['id'],
        name: json['name'],
        genres: List<int>.from(json["genres"]),
        summary: json['summary'],
        cover: json['cover'],
     );
   }

   Map<String, dynamic> toJson() {
      final Map<String, dynamic> data = new Map<String, dynamic>();
      data['id'] = this.id;
      data['cover'] = this.cover;
      data['genres'] = this.genres;
      data['name'] = this.name;
      data['summary'] = this.summary;
      return data;
   }
}