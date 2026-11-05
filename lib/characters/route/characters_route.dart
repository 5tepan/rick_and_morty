import 'package:base_flutter_proj/characters/characters_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'characters_route.g.dart';

const String _charactersPath = '/characters';

@TypedGoRoute<CharactersRoute>(path: _charactersPath)
class CharactersRoute extends GoRouteData with $CharactersRoute {
  const CharactersRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const CharactersPage();
  }
}
