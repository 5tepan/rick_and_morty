import 'package:base_flutter_proj/characters/character_detail_page.dart';
import 'package:base_flutter_proj/characters/characters_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'characters_route.g.dart';

const String _charactersPath = '/characters';

@TypedGoRoute<CharactersRoute>(
  path: _charactersPath,
  routes: [TypedGoRoute<CharacterDetailRoute>(path: ':characterId')],
)
class CharactersRoute extends GoRouteData with $CharactersRoute {
  const CharactersRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const CharactersPage();
  }
}

class CharacterDetailRoute extends GoRouteData with $CharacterDetailRoute {
  const CharacterDetailRoute({required this.characterId});

  final int characterId;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return CharacterDetailPage(characterId: characterId);
  }
}
