import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_paywall_app/design.dart';
import 'package:test_paywall_app/gen/assets.gen.dart';
import 'package:test_paywall_app/presentation/ui_kit/ui_kit.dart';

class PaywallScreen extends StatelessWidget {
  const PaywallScreen({super.key});

  final chosenIndex = 0;

  @override
  Widget build(BuildContext context) {

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
            SubscriptionButtonsBuilder(),
            const Gap(16),
            SubscriptionInfoCard.messages(),
            SubscriptionInfoCard.discount(),
            SubscriptionInfoCard.research(),
            SubscriptionInfoCard.search(),
            const Gap(36),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CustomButton(onTap: (){}),
            ),
            const Gap(48),
          ],
        ),
      ),
    );
  }
}
