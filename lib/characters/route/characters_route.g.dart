// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'characters_route.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$charactersRoute];

RouteBase get $charactersRoute => GoRouteData.$route(
  path: '/characters',
  factory: $CharactersRoute._fromState,
);

mixin $CharactersRoute on GoRouteData {
  static CharactersRoute _fromState(GoRouterState state) =>
      const CharactersRoute();

  @override
  String get location => GoRouteData.$location('/characters');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}
