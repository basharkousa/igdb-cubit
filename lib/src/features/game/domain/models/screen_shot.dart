class ScreenShot{
  final String? _imageId;
  final String? _link;

  ScreenShot({
    required String? imageId,
    required String? link,
  })  : _imageId = imageId,
        _link = link;

  ScreenShot copyWith({
    String? gameId,
    String? link,
  }) {
    return ScreenShot(
      imageId: gameId ?? _imageId,
      link: link ?? _link,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is ScreenShot &&
              runtimeType == other.runtimeType &&
              _imageId == other._imageId &&
              _link == other._link);

  @override
  int get hashCode => _imageId.hashCode ^ _link.hashCode;


  String? get link => _link;

  String? get gameId => _imageId;
}