import 'package:base_flutter_proj/characters/entities/character.dart';
import 'package:base_flutter_proj/characters/providers/characters_providers.dart';
import 'package:base_flutter_proj/characters/repository/characters_repository.dart';
import 'package:base_flutter_proj/core/base/base_pages/pagination/paginated_notifier.dart';
import 'package:base_flutter_proj/core/base/base_pages/pagination/paginated_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CharactersListNotifier extends PaginatedNotifier<Character> {
  late CharactersRepository _repository;

  @override
  PaginatedState<Character> build() {
    _repository = ref.read(charactersRepositoryProvider);
    return super.build();
  }

  @override
  Future<PaginatedPage<Character>> loadPage(int page) async {
    final result = await _repository.fetchCharacters(page: page);
    return PaginatedPage(items: result.results, hasNext: result.info.hasNext);
  }
}

final charactersListProvider =
    NotifierProvider<CharactersListNotifier, PaginatedState<Character>>(
      CharactersListNotifier.new,
    );
