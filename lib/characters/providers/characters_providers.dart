import 'package:base_flutter_proj/characters/api/characters_api.dart';
import 'package:base_flutter_proj/characters/api/characters_api_impl.dart';
import 'package:base_flutter_proj/characters/repository/characters_repository.dart';
import 'package:base_flutter_proj/core/providers/public_api_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final charactersApiProvider = Provider<CharactersApi>((ref) {
  return CharactersApiImpl(ref.watch(publicApiProvider));
});

final charactersRepositoryProvider = Provider<CharactersRepository>((ref) {
  return CharactersRepository(ref.watch(charactersApiProvider));
});
