import 'dart:async';

import 'package:base_flutter_proj/characters/entities/character.dart';
import 'package:base_flutter_proj/characters/providers/characters_providers.dart';
import 'package:base_flutter_proj/characters/repository/characters_repository.dart';
import 'package:base_flutter_proj/core/base/base_pages/pagination/paginated_notifier.dart';
import 'package:base_flutter_proj/core/base/base_pages/pagination/paginated_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CharactersListNotifier extends PaginatedNotifier<Character> {
  late CharactersRepository _repository;
  Timer? _searchDebounce;
  String _query = '';

  String get query => _query;

  void setQuery(String value) {
    if (_query == value) return;
    final previousQuery = _query.trim();
    _query = value;
    if (previousQuery == value.trim()) return;

    _searchDebounce?.cancel();
    prepareForNewQuery();
    _searchDebounce = Timer(const Duration(milliseconds: 350), loadInitial);
  }

  @override
  PaginatedState<Character> build() {
    _repository = ref.read(charactersRepositoryProvider);
    ref.onDispose(() => _searchDebounce?.cancel());
    return super.build();
  }

  @override
  Future<PaginatedPage<Character>> loadPage(int page) async {
    final result = await _repository.fetchCharacters(
      page: page,
      name: _query.trim(),
    );
    return PaginatedPage(items: result.results, hasNext: result.info.hasNext);
  }
}

final charactersListProvider =
    NotifierProvider<CharactersListNotifier, PaginatedState<Character>>(
      CharactersListNotifier.new,
    );
