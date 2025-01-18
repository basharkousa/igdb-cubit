// Genres

class GenreModel {
  GenreModel({
    num? id,
    num? createdAt,
    String? name,
    String? slug,
    num? updatedAt,
    String? url,
    String? checksum,}){
    _id = id;
    _createdAt = createdAt;
    _name = name;
    _slug = slug;
    _updatedAt = updatedAt;
    _url = url;
    _checksum = checksum;
  }

  GenreModel.fromJson(dynamic json) {
    _id = json['id'];
    _createdAt = json['created_at'];
    _name = json['name'];
    _slug = json['slug'];
    _updatedAt = json['updated_at'];
    _url = json['url'];
    _checksum = json['checksum'];
  }
  num? _id;
  num? _createdAt;
  String? _name;
  String? _slug;
  num? _updatedAt;
  String? _url;
  String? _checksum;
  GenreModel copyWith({  num? id,
    num? createdAt,
    String? name,
    String? slug,
    num? updatedAt,
    String? url,
    String? checksum,
  }) => GenreModel(  id: id ?? _id,
    createdAt: createdAt ?? _createdAt,
    name: name ?? _name,
    slug: slug ?? _slug,
    updatedAt: updatedAt ?? _updatedAt,
    url: url ?? _url,
    checksum: checksum ?? _checksum,
  );
  num? get id => _id;
  num? get createdAt => _createdAt;
  String? get name => _name;
  String? get slug => _slug;
  num? get updatedAt => _updatedAt;
  String? get url => _url;
  String? get checksum => _checksum;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['created_at'] = _createdAt;
    map['name'] = _name;
    map['slug'] = _slug;
    map['updated_at'] = _updatedAt;
    map['url'] = _url;
    map['checksum'] = _checksum;
    return map;
  }

}
