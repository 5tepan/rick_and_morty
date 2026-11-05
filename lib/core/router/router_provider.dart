import 'package:base_flutter_proj/home/route/home_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  final router = GoRouter(
    initialLocation: const HomeRoute().location,
    navigatorKey: rootNavigatorKey,
    routes: [$homeRoute],
  );
  ref.onDispose(router.dispose);
  return router;
});

final rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
