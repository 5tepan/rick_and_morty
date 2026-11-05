import 'package:base_flutter_proj/characters/api/characters_api.dart';
import 'package:base_flutter_proj/characters/entities/character.dart';
import 'package:base_flutter_proj/characters/entities/characters_page.dart';

class CharactersRepository {
  CharactersRepository(this._api);

  final CharactersApi _api;

  Future<CharactersPage> fetchCharacters({required int page, String? name}) =>
      _api.fetchCharacters(page: page, name: name);

  Future<Character> fetchCharacter(int id) => _api.fetchCharacter(id);
}
