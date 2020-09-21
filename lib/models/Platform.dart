
class Platform{
  final int id;
  final String name;

  Platform({this.id,this.name});

  factory Platform.fromJson(Map <String,dynamic> json){
    return Platform(
      id : json['id'],
      name: json['name'],
    );
  }
}