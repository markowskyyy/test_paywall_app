import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:test_paywall_app/design.dart';
import 'package:test_paywall_app/gen/assets.gen.dart';
import 'package:test_paywall_app/presentation/providers/subscription_providers.dart';
import 'package:test_paywall_app/presentation/ui_kit/ui_kit.dart';

class PaywallScreen extends ConsumerWidget {
  const PaywallScreen({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(subscriptionViewModelProvider);
    final notifier = ref.read(subscriptionViewModelProvider.notifier);

    return Scaffold(
      backgroundColor: AppColors.primaryRed,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 8,
          children: [
            const Gap(48),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(Assets.svgs.heart),
              ],
            ),
            const Gap(8),
            Text(
              'Test Wallet APP Premium',
              style: bTitleTextStyle,
            ),
            Text(
              'Test Wallet APP Premium',
              style: nSubtitleTextStyle,
            ),
            const Gap(16),
            SubscriptionButtonsBuilder(
              func: (plan) => notifier.selectPlan(plan),
            ),
            const Gap(16),
            SubscriptionInfoCard.messages(),
            SubscriptionInfoCard.discount(),
            SubscriptionInfoCard.research(),
            SubscriptionInfoCard.search(),
            const Gap(36),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CustomButton(
                onTap: () async {
                  if (viewModel.selectedPlan == null) return;
                  await notifier.purchaseSelectedPlan();
                  context.go('/main');
                },
                text: viewModel.selectedPlan != null
                    ? 'Оплатить подписку'
                    : 'Выберите план',
              ),
            ),
            const Gap(48),
          ],
        ),
      ),
    );
  }
}
