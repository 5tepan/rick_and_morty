import 'package:base_flutter_proj/characters/entities/character.dart';
import 'package:json_annotation/json_annotation.dart';

part 'characters_page.g.dart';

@JsonSerializable(explicitToJson: true)
class CharactersPage {
  const CharactersPage({required this.info, required this.results});

  const CharactersPage.empty()
    : info = const CharactersPageInfo(count: 0, pages: 0),
      results = const [];

  final CharactersPageInfo info;
  final List<Character> results;

  factory CharactersPage.fromJson(Map<String, dynamic> json) =>
      _$CharactersPageFromJson(json);

  Map<String, dynamic> toJson() => _$CharactersPageToJson(this);
}

@JsonSerializable()
class CharactersPageInfo {
  const CharactersPageInfo({
    required this.count,
    required this.pages,
    this.next,
    this.prev,
  });

  final int count;
  final int pages;
  final String? next;
  final String? prev;

  bool get hasNext => next != null;

  factory CharactersPageInfo.fromJson(Map<String, dynamic> json) =>
      _$CharactersPageInfoFromJson(json);

  Map<String, dynamic> toJson() => _$CharactersPageInfoToJson(this);
}
