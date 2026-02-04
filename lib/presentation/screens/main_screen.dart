import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:test_paywall_app/presentation/providers/subscription_providers.dart';
import 'package:test_paywall_app/presentation/ui_kit/ui_kit.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(subscriptionViewModelProvider);
    final notifier = ref.read(subscriptionViewModelProvider.notifier);
    final subscription = viewModel.subscription;

    Future<void> onReset() async {
      await notifier.reset();
      context.go('/paywall');
    }

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.verified,
                size: 100,
                color: Colors.green,
              ),
              const Gap(24),
              const Text(
                'Подписка активна!',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Gap(12),
              if (subscription?.planType != null)
                Text(
                  'План: ${subscription!.planType!.displayName}',
                  style: const TextStyle(fontSize: 18),
                ),
              const Gap(36),
              const Text(
                '🎉 Теперь вам доступны все функции приложения!',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              const Gap(36),
              CustomButton.dark(
                onTap: onReset,
                text: 'Сбросить подписку',
              )
            ],
          ),
        ),
      ),
    );
  }
}