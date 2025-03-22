class Cover{
  String? _url;
  String? _imageId;

  String? get url => _url;


  String? get imageId => _imageId;

  Cover({
    required String? url,
    required String? imageId,
  })  : _url = url,
        _imageId = imageId;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Cover &&
          runtimeType == other.runtimeType &&
          _url == other._url &&
          _imageId == other._imageId);

  @override
  int get hashCode => _url.hashCode ^ _imageId.hashCode;

  @override
  String toString() {
    return 'Cover{' + ' _url: $_url,' + ' _imageId: $_imageId,' + '}';
  }

  Cover copyWith({
    String? url,
    String? imageId,
  }) {
    return Cover(
      url: url ?? this._url,
      imageId: imageId ?? this._imageId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      '_url': this._url,
      '_imageId': this._imageId,
    };
  }

  factory Cover.fromMap(Map<String, dynamic> map) {
    return Cover(
      url: map['_url'] as String,
      imageId: map['_imageId'] as String,
    );
  }

}