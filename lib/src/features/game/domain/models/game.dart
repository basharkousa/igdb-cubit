import 'cover.dart';
import 'screen_shot.dart';

class Game {
  final int? _id;
  final Cover? _cover;
  final String? _name;
  final List<ScreenShot>? _screenshots;
  final String? _summary;
  final double? _ratings;
  final bool _isFavourite;

  Game({
    required int? id,
    required Cover? cover,
    required String? name,
    required List<ScreenShot>? screenshots,
    required String? summary,
    required double? ratings,
    required bool isFavourite,
  })  : _id = id,
        _cover = cover,
        _name = name,
        _screenshots = screenshots,
        _summary = summary,
        _ratings = ratings,
        _isFavourite = isFavourite;

  bool get isFavourite => _isFavourite;

  double? get ratings => _ratings;

  String? get summary => _summary;

  List<ScreenShot>? get screenshots => _screenshots;

  String? get name => _name;

  // String? get coverBig =>
  //     "https://images.igdb.com/igdb/image/upload/t_cover_big/${_cover?.imageId}.jpg";
 String? get coverBig => _cover?.url;

  int? get id => _id;

  Game copyWith({
    int? id,
    Cover? cover,
    String? name,
    List<ScreenShot>? screenshots,
    String? summary,
    double? ratings,
    bool? isFavourite,
  }) {
    return Game(
      id: id ?? _id,
      cover: cover ?? _cover,
      name: name ?? _name,
      screenshots: screenshots ?? _screenshots,
      summary: summary ?? _summary,
      ratings: ratings ?? _ratings,
      isFavourite: isFavourite ?? _isFavourite,
    );
  }
}
