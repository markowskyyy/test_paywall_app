import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_paywall_app/presentation/providers/subscription_providers.dart';
import 'package:test_paywall_app/presentation/screens/main_screen.dart';
import 'package:test_paywall_app/presentation/screens/paywall_screen.dart';

final initialSubscriptionStateProvider = Provider<bool>((ref) {
  return false;
});

final appRouterProvider = Provider<GoRouter>((ref) {
  final initialIsSubscribed = ref.watch(initialSubscriptionStateProvider);
  final isSubscribedAsync = ref.watch(isSubscribedProvider);

  return GoRouter(
    initialLocation: initialIsSubscribed ? '/main' : '/paywall',
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
    redirect: (context, state) {
      final isSubscribed = isSubscribedAsync;

      if (isSubscribed && state.matchedLocation == '/paywall') {
        return '/main';
      }

      if (!isSubscribed && state.matchedLocation == '/main') {
        return '/paywall';
      }

      return null;
    },
  );
});