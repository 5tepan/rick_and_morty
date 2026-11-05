import 'package:base_flutter_proj/characters/entities/character.dart';
import 'package:base_flutter_proj/characters/entities/characters_page.dart';

abstract class CharactersApi {
  Future<CharactersPage> fetchCharacters({required int page, String? name});

  Future<Character> fetchCharacter(int id);
}
