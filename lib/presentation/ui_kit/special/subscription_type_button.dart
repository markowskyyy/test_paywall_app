import 'package:flutter/material.dart';
import 'package:test_paywall_app/design.dart';
import 'package:test_paywall_app/domain/entities/subscription_plan_type.dart';
import 'package:test_paywall_app/presentation/ui_kit/ui_kit.dart';

class SubscriptionTypeButton extends StatelessWidget {
  final bool isActive;
  final SubscriptionPlanType planType;
  final VoidCallback onTap;
  final double size;

  const SubscriptionTypeButton({
    super.key,
    required this.isActive,
    required this.planType,
    required this.onTap,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    final borderColor = isActive
        ? AppColors.activeButtonBorderColor
        : AppColors.unactiveButtonBorderColor;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: size,
        width: size,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: borderColor, width: 2),
          color: AppColors.darkWine,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              planType.displayName,
              style: bMediumTextStyle,
            ),
            const Gap(4),
            Text(
              '${planType.price.toStringAsFixed(0)} ₽',
              style: nMediumTextStyle,
              textAlign: TextAlign.center,
            ),
            const Gap(4),
            Text(
              '${planType.pricePerYear.toStringAsFixed(0)} ₽ / в год',
              style: lSmallDiscountTextStyle,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
