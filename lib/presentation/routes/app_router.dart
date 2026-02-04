import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_paywall_app/presentation/screens/main_screen.dart';
import 'package:test_paywall_app/presentation/screens/paywall_screen.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  // final isSubscribed = ref.watch(isSubscribedProvider);

  return GoRouter(
    initialLocation: '/paywall',
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: '/paywall',
        name: 'paywall',
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: const PaywallScreen(),
        ),
      ),
      GoRoute(
        path: '/main',
        name: 'main',
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: const MainScreen(),
        ),
      ),
    ],
    // redirect: (context, state) {
    //   // Если пользователь подписан и пытается зайти на paywall - редиректим на main
    //   if (isSubscribed && state.matchedLocation == '/paywall') {
    //     return '/main';
    //   }
    //
    //   // Если не подписан и пытается зайти на main - редиректим на paywall
    //   if (!isSubscribed && state.matchedLocation == '/main') {
    //     return '/paywall';
    //   }
    //
    //   return null;
    // },
  );
});