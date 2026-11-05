import 'package:base_flutter_proj/characters/api/characters_api.dart';
import 'package:base_flutter_proj/characters/entities/character.dart';
import 'package:base_flutter_proj/characters/entities/characters_page.dart';
import 'package:base_flutter_proj/core/base/base_api/api_response_parser.dart';
import 'package:base_flutter_proj/core/network/public_api.dart';

class CharactersApiImpl implements CharactersApi {
  CharactersApiImpl(this._api);

  final PublicApi _api;
  static const _charactersPath = 'character';

  @override
  Future<CharactersPage> fetchCharacters({
    required int page,
    String? name,
  }) async {
    if (page < 1) throw ArgumentError.value(page, 'page', 'Must be at least 1');
    final query = name?.trim();
    final response = await _api.sendGetRequest(
      _charactersPath,
      params: {
        'page': page,
        if (query != null && query.isNotEmpty) 'name': query,
      },
    );

    // 404 этой формы означает отсутствие совпадений только для первого запроса поиска.
    if (page == 1 &&
        query != null &&
        query.isNotEmpty &&
        response.statusCode == 404 &&
        response.dataJson is Map &&
        (response.dataJson as Map)['error'] == 'There is nothing here') {
      return const CharactersPage.empty();
    }
    return ApiResponseParser.parseObjectOrThrow<CharactersPage>(
      response,
      fromJson: CharactersPage.fromJson,
    );
  }

  @override
  Future<Character> fetchCharacter(int id) async {
    if (id < 1) throw ArgumentError.value(id, 'id', 'Must be at least 1');
    final response = await _api.sendGetRequest('$_charactersPath/$id');
    return ApiResponseParser.parseObjectOrThrow<Character>(
      response,
      fromJson: Character.fromJson,
    );
  }
}
