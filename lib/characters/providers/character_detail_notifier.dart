import 'package:base_flutter_proj/characters/entities/character.dart';
import 'package:base_flutter_proj/characters/providers/characters_providers.dart';
import 'package:base_flutter_proj/characters/repository/characters_repository.dart';
import 'package:base_flutter_proj/core/base/model/notifiers/item_notifier.dart';
import 'package:base_flutter_proj/core/base/model/states/entity_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CharacterDetailNotifier extends ItemNotifier<Character> {
  CharacterDetailNotifier(this.characterId);

  final int characterId;
  late CharactersRepository _repository;

  @override
  EntityState<Character> build() {
    _repository = ref.read(charactersRepositoryProvider);
    return super.build();
  }

  @override
  Future<Character> loadItem() => _repository.fetchCharacter(characterId);
}

final characterDetailProvider =
    NotifierProvider.family<
      CharacterDetailNotifier,
      EntityState<Character>,
      int
    >(CharacterDetailNotifier.new);
