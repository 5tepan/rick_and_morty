import 'package:base_flutter_proj/characters/entities/character_location.dart';
import 'package:json_annotation/json_annotation.dart';

part 'character.g.dart';

@JsonSerializable(explicitToJson: true)
class Character {
  const Character({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.image,
    required this.origin,
    required this.location,
  });

  final int id;
  final String name;
  final String status;
  final String species;
  final String image;
  final CharacterLocation origin;
  final CharacterLocation location;

  factory Character.fromJson(Map<String, dynamic> json) =>
      _$CharacterFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterToJson(this);
}
