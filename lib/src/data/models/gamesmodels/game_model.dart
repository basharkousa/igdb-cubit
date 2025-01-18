import 'package:igameapp/src/data/models/gamesmodels/subclasses/cover_model.dart';
import 'package:igameapp/src/data/models/gamesmodels/subclasses/genre_model.dart';
import 'package:igameapp/src/data/models/gamesmodels/subclasses/player_perspective_model.dart';
import 'package:igameapp/src/data/models/gamesmodels/subclasses/screenshot_model.dart';
import 'package:igameapp/src/data/models/gamesmodels/subclasses/video_model.dart';
class GameModel {
  GameModel({
    int? id,
    double? rating,
    int? rateCount,
    List<num>? ageRatings,
    List<num>? alternativeNames,
    num? category,
    CoverModel? cover,
    num? createdAt,
    List<num>? externalGames,
    num? firstReleaseDate,
    List<num>? gameModes,
    List<GenreModel>? genres,
    List<num>? involvedCompanies,
    List<num>? keywords,
    String? name,
    List<num>? platforms,
    List<PlayerPerspectiveModel>? playerPerspectives,
    List<num>? releaseDates,
    List<ScreenshotModel>? screenshots,
    List<num>? similarGames,
    String? slug,
    String? storyline,
    String? summary,
    List<num>? tags,
    List<num>? themes,
    num? updatedAt,
    String? url,
    List<VideoModel>? videos,
    List<num>? websites,
    String? checksum,
    List<num>? gameLocalizations,}){
    _id = id;
    _ratings = rating;
    _rateCount = ratingCount;
    _ageRatings = ageRatings;
    _alternativeNames = alternativeNames;
    _category = category;
    _cover = cover;
    _createdAt = createdAt;
    _externalGames = externalGames;
    _firstReleaseDate = firstReleaseDate;
    _gameModes = gameModes;
    _genres = genres;
    _involvedCompanies = involvedCompanies;
    _keywords = keywords;
    _name = name;
    _platforms = platforms;
    _playerPerspectives = playerPerspectives;
    _releaseDates = releaseDates;
    _screenshots = screenshots;
    _similarGames = similarGames;
    _slug = slug;
    _storyline = storyline;
    _summary = summary;
    _tags = tags;
    _themes = themes;
    _updatedAt = updatedAt;
    _url = url;
    _videos = videos;
    _websites = websites;
    _checksum = checksum;
    _gameLocalizations = gameLocalizations;
  }

  GameModel.fromJson(dynamic json) {
    _id = json['id'];
    _ratings = json['rating'];
    _rateCount = json['rating_count'];
    _ageRatings = json['age_ratings'] != null ? json['age_ratings'].cast<num>() : [];
    _alternativeNames = json['alternative_names'] != null ? json['alternative_names'].cast<num>() : [];
    _category = json['category'];
    _cover = json['cover'] != null ? CoverModel.fromJson(json['cover']) : null;
    _createdAt = json['created_at'];
    _externalGames = json['external_games'] != null ? json['external_games'].cast<num>() : [];
    _firstReleaseDate = json['first_release_date'];
    _gameModes = json['game_modes'] != null ? json['game_modes'].cast<num>() : [];
    if (json['genres'] != null) {
      _genres = [];
      json['genres'].forEach((v) {
        _genres?.add(GenreModel.fromJson(v));
      });
    }
    _involvedCompanies = json['involved_companies'] != null ? json['involved_companies'].cast<num>() : [];
    _keywords = json['keywords'] != null ? json['keywords'].cast<num>() : [];
    _name = json['name'];
    _platforms = json['platforms'] != null ? json['platforms'].cast<num>() : [];
    if (json['player_perspectives'] != null) {
      _playerPerspectives = [];
      json['player_perspectives'].forEach((v) {
        _playerPerspectives?.add(PlayerPerspectiveModel.fromJson(v));
      });
    }
    _releaseDates = json['release_dates'] != null ? json['release_dates'].cast<num>() : [];
    if (json['screenshots'] != null) {
      _screenshots = [];
      json['screenshots'].forEach((v) {
        _screenshots?.add(ScreenshotModel.fromJson(v));
      });
    }
    _similarGames = json['similar_games'] != null ? json['similar_games'].cast<num>() : [];
    _slug = json['slug'];
    _storyline = json['storyline'];
    _summary = json['summary'];
    _tags = json['tags'] != null ? json['tags'].cast<num>() : [];
    _themes = json['themes'] != null ? json['themes'].cast<num>() : [];
    _updatedAt = json['updated_at'];
    _url = json['url'];
    if (json['videos'] != null) {
      _videos = [];
      json['videos'].forEach((v) {
        _videos?.add(VideoModel.fromJson(v));
      });
    }
    _websites = json['websites'] != null ? json['websites'].cast<num>() : [];
    _checksum = json['checksum'];
    _gameLocalizations = json['game_localizations'] != null ? json['game_localizations'].cast<num>() : [];
  }
  int? _id;
  double? _ratings;
  int? _rateCount;
  List<num>? _ageRatings;
  List<num>? _alternativeNames;
  num? _category;
  CoverModel? _cover;
  num? _createdAt;
  List<num>? _externalGames;
  num? _firstReleaseDate;
  List<num>? _gameModes;
  List<GenreModel>? _genres;
  List<num>? _involvedCompanies;
  List<num>? _keywords;
  String? _name;
  List<num>? _platforms;
  List<PlayerPerspectiveModel>? _playerPerspectives;
  List<num>? _releaseDates;
  List<ScreenshotModel>? _screenshots;
  List<num>? _similarGames;
  String? _slug;
  String? _storyline;
  String? _summary;
  List<num>? _tags;
  List<num>? _themes;
  num? _updatedAt;
  String? _url;
  List<VideoModel>? _videos;
  List<num>? _websites;
  String? _checksum;
  List<num>? _gameLocalizations;
  GameModel copyWith({
    int? id,
    double? rating,
    int? rateCount,

    List<num>? ageRatings,
    List<num>? alternativeNames,
    num? category,
    CoverModel? cover,
    num? createdAt,
    List<num>? externalGames,
    num? firstReleaseDate,
    List<num>? gameModes,
    List<GenreModel>? genres,
    List<num>? involvedCompanies,
    List<num>? keywords,
    String? name,
    List<num>? platforms,
    List<PlayerPerspectiveModel>? playerPerspectives,
    List<num>? releaseDates,
    List<ScreenshotModel>? screenshots,
    List<num>? similarGames,
    String? slug,
    String? storyline,
    String? summary,
    List<num>? tags,
    List<num>? themes,
    num? updatedAt,
    String? url,
    List<VideoModel>? videos,
    List<num>? websites,
    String? checksum,
    List<num>? gameLocalizations,
  }) => GameModel(
    id: id ?? _id,
    rating: rating ?? _ratings,
    rateCount: rateCount ?? _rateCount,
    ageRatings: ageRatings ?? _ageRatings,
    alternativeNames: alternativeNames ?? _alternativeNames,
    category: category ?? _category,
    cover: cover ?? _cover,
    createdAt: createdAt ?? _createdAt,
    externalGames: externalGames ?? _externalGames,
    firstReleaseDate: firstReleaseDate ?? _firstReleaseDate,
    gameModes: gameModes ?? _gameModes,
    genres: genres ?? _genres,
    involvedCompanies: involvedCompanies ?? _involvedCompanies,
    keywords: keywords ?? _keywords,
    name: name ?? _name,
    platforms: platforms ?? _platforms,
    playerPerspectives: playerPerspectives ?? _playerPerspectives,
    releaseDates: releaseDates ?? _releaseDates,
    screenshots: screenshots ?? _screenshots,
    similarGames: similarGames ?? _similarGames,
    slug: slug ?? _slug,
    storyline: storyline ?? _storyline,
    summary: summary ?? _summary,
    tags: tags ?? _tags,
    themes: themes ?? _themes,
    updatedAt: updatedAt ?? _updatedAt,
    url: url ?? _url,
    videos: videos ?? _videos,
    websites: websites ?? _websites,
    checksum: checksum ?? _checksum,
    gameLocalizations: gameLocalizations ?? _gameLocalizations,
  );
  int? get id => _id;
  double? get rating => _ratings;
  int? get ratingCount => _rateCount;
  List<num>? get ageRatings => _ageRatings;
  List<num>? get alternativeNames => _alternativeNames;
  num? get category => _category;
  CoverModel? get cover => _cover;
  num? get createdAt => _createdAt;
  List<num>? get externalGames => _externalGames;
  num? get firstReleaseDate => _firstReleaseDate;
  List<num>? get gameModes => _gameModes;
  List<GenreModel>? get genres => _genres;
  List<num>? get involvedCompanies => _involvedCompanies;
  List<num>? get keywords => _keywords;
  String? get name => _name;
  List<num>? get platforms => _platforms;
  List<PlayerPerspectiveModel>? get playerPerspectives => _playerPerspectives;
  List<num>? get releaseDates => _releaseDates;
  List<ScreenshotModel>? get screenshots => _screenshots;
  List<num>? get similarGames => _similarGames;
  String? get slug => _slug;
  String? get storyline => _storyline;
  String? get summary => _summary;
  List<num>? get tags => _tags;
  List<num>? get themes => _themes;
  num? get updatedAt => _updatedAt;
  String? get url => _url;
  List<VideoModel>? get videos => _videos;
  List<num>? get websites => _websites;
  String? get checksum => _checksum;
  List<num>? get gameLocalizations => _gameLocalizations;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['rating'] = _ratings;
    map['rating_count'] = _rateCount;
    map['age_ratings'] = _ageRatings;
    map['alternative_names'] = _alternativeNames;
    map['category'] = _category;
    if (_cover != null) {
      map['cover'] = _cover?.toJson();
    }
    map['created_at'] = _createdAt;
    map['external_games'] = _externalGames;
    map['first_release_date'] = _firstReleaseDate;
    map['game_modes'] = _gameModes;
    if (_genres != null) {
      map['genres'] = _genres?.map((v) => v.toJson()).toList();
    }
    map['involved_companies'] = _involvedCompanies;
    map['keywords'] = _keywords;
    map['name'] = _name;
    map['platforms'] = _platforms;
    if (_playerPerspectives != null) {
      map['player_perspectives'] = _playerPerspectives?.map((v) => v.toJson()).toList();
    }
    map['release_dates'] = _releaseDates;
    if (_screenshots != null) {
      map['screenshots'] = _screenshots?.map((v) => v.toJson()).toList();
    }
    map['similar_games'] = _similarGames;
    map['slug'] = _slug;
    map['storyline'] = _storyline;
    map['summary'] = _summary;
    map['tags'] = _tags;
    map['themes'] = _themes;
    map['updated_at'] = _updatedAt;
    map['url'] = _url;
    if (_videos != null) {
      map['videos'] = _videos?.map((v) => v.toJson()).toList();
    }
    map['websites'] = _websites;
    map['checksum'] = _checksum;
    map['game_localizations'] = _gameLocalizations;
    return map;
  }

}
