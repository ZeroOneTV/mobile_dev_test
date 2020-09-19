

class Game {
   String _name;
   String _genre;
   String _summary;
   String _cover;
   String _checksum;

   String get name => _name;

  set name(String value) {
    _name = value;
  }

   String get genre => _genre;

   String get checksum => _checksum;

  set checksum(String value) {
    _checksum = value;
  }

  String get cover => _cover;

  set cover(String value) {
    _cover = value;
  }

  String get summary => _summary;

  set summary(String value) {
    _summary = value;
  }

  set genre(String value) {
    _genre = value;
  }
}