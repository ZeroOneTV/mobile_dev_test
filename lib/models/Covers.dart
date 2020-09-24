class Covers {
  int id;
  int game;
  int height;
  int width;
  String url;

  Covers({this.id, this.game, this.width, this.height, this.url});

  factory Covers.fromJson(Map <String, dynamic> json){
    return Covers(
      id: json['id'],
      game: json['game'],
      height: json['height'],
      url: json['url'],
      width: json['width'],
    );
  }
}

