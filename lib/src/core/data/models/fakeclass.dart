import 'package:igameapp/src/core/data/models/gamesmodels/game_model.dart';

class FakeClass{

  String? name;
  int? number;
  List<GameModel>? games;

//<editor-fold desc="Data Methods">
  FakeClass({
    this.name,
    this.number,
    this.games,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FakeClass &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          number == other.number &&
          games == other.games);

  @override
  int get hashCode => name.hashCode ^ number.hashCode ^ games.hashCode;

  @override
  String toString() {
    return 'FakeClass{' +
        ' name: $name,' +
        ' number: $number,' +
        ' games: $games,' +
        '}';
  }

  FakeClass copyWith({
    String? name,
    int? number,
    List<GameModel>? games,
  }) {
    return FakeClass(
      name: name ?? this.name,
      number: number ?? this.number,
      games: games ?? this.games,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'number': number,
      'games': games,
    };
  }

  factory FakeClass.fromMap(Map<String, dynamic> map) {
    return FakeClass(
      name: map['name'] as String,
      number: map['number'] as int,
      games: map['games'] as List<GameModel>,
    );
  }
}