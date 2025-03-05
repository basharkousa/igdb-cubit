class CoverModel {
  CoverModel({
    num? id,
    bool? alphaChannel,
    bool? animated,
    num? game,
    num? height,
    String? imageId,
    String? url,
    num? width,
    String? checksum,}){
    _id = id;
    _alphaChannel = alphaChannel;
    _animated = animated;
    _game = game;
    _height = height;
    _imageId = imageId;
    _url = url;
    _width = width;
    _checksum = checksum;
  }

  CoverModel.fromJson(dynamic json) {
    _id = json['id'];
    _alphaChannel = json['alpha_channel'];
    _animated = json['animated'];
    _game = json['game'];
    _height = json['height'];
    _imageId = json['image_id'];
    _url = json['url'];
    _width = json['width'];
    _checksum = json['checksum'];
  }
  num? _id;
  bool? _alphaChannel;
  bool? _animated;
  num? _game;
  num? _height;
  String? _imageId;
  String? _url;
  num? _width;
  String? _checksum;
  CoverModel copyWith({  num? id,
    bool? alphaChannel,
    bool? animated,
    num? game,
    num? height,
    String? imageId,
    String? url,
    num? width,
    String? checksum,
  }) => CoverModel(  id: id ?? _id,
    alphaChannel: alphaChannel ?? _alphaChannel,
    animated: animated ?? _animated,
    game: game ?? _game,
    height: height ?? _height,
    imageId: imageId ?? _imageId,
    url: url ?? _url,
    width: width ?? _width,
    checksum: checksum ?? _checksum,
  );
  num? get id => _id;
  bool? get alphaChannel => _alphaChannel;
  bool? get animated => _animated;
  num? get game => _game;
  num? get height => _height;
  String? get imageId => _imageId;
  String? get url => _url;
  num? get width => _width;
  String? get checksum => _checksum;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['alpha_channel'] = _alphaChannel;
    map['animated'] = _animated;
    map['game'] = _game;
    map['height'] = _height;
    map['image_id'] = _imageId;
    map['url'] = _url;
    map['width'] = _width;
    map['checksum'] = _checksum;
    return map;
  }

}