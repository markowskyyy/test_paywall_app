import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_paywall_app/data/datasources/local_subscription_datasource.dart';
import 'package:test_paywall_app/data/repositories/subscription_repository_impl.dart';
import 'package:test_paywall_app/presentation/routes/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final repository = SubscriptionRepositoryImpl(LocalSubscriptionDataSource());
  final initialSubscription = await repository.getSubscription();
  final initialIsSubscribed = initialSubscription?.isSubscribed == true;

  runApp(
      ProviderScope(
          overrides: [
            initialSubscriptionStateProvider.overrideWithValue(initialIsSubscribed),
          ],
          child: const MyApp()
      )
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
        cardTheme: CardTheme(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      routerConfig: router,
    );
  }
}


