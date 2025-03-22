class ScreenShot{
  int? _gameId;
  String? _link;

  ScreenShot({
    required int? gameId,
    required String? link,
  })  : _gameId = gameId,
        _link = link;

  ScreenShot copyWith({
    int? gameId,
    String? link,
  }) {
    return ScreenShot(
      gameId: gameId ?? _gameId,
      link: link ?? _link,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is ScreenShot &&
              runtimeType == other.runtimeType &&
              _gameId == other._gameId &&
              _link == other._link);

  @override
  int get hashCode => _gameId.hashCode ^ _link.hashCode;


  String? get link => _link;

  int? get gameId => _gameId;
}