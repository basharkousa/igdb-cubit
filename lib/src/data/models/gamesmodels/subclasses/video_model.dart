class VideoModel {
  VideoModel({
    num? id,
    num? game,
    String? name,
    String? videoId,
    String? checksum,
  }) {
    _id = id;
    _game = game;
    _name = name;
    _videoId = videoId;
    _checksum = checksum;
  }

  VideoModel.fromJson(dynamic json) {
    _id = json['id'];
    _game = json['game'];
    _name = json['name'];
    _videoId = json['video_id'];
    _checksum = json['checksum'];
  }

  num? _id;
  num? _game;
  String? _name;
  String? _videoId;
  String? _checksum;

  VideoModel copyWith({
    num? id,
    num? game,
    String? name,
    String? videoId,
    String? checksum,
  }) =>
      VideoModel(
        id: id ?? _id,
        game: game ?? _game,
        name: name ?? _name,
        videoId: videoId ?? _videoId,
        checksum: checksum ?? _checksum,
      );

  num? get id => _id;

  num? get game => _game;

  String? get name => _name;

  String? get videoId => _videoId;

  String? get checksum => _checksum;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['game'] = _game;
    map['name'] = _name;
    map['video_id'] = _videoId;
    map['checksum'] = _checksum;
    return map;
  }
}
