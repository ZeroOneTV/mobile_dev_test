class Covers {
  final int id;
  final int game;
  final int height;
  final int width;
  final String url;

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

