import 'package:flutter/material.dart';
import 'package:test_paywall_app/domain/entities/subscription_plan_type.dart';
import 'package:test_paywall_app/presentation/ui_kit/ui_kit.dart';

class SubscriptionButtonsBuilder extends StatefulWidget {
  const SubscriptionButtonsBuilder({super.key});

  @override
  State<SubscriptionButtonsBuilder> createState() => _SubscriptionButtonsBuilderState();
}

class _SubscriptionButtonsBuilderState extends State<SubscriptionButtonsBuilder> {

  var chosenIndex = 0;

  @override
  Widget build(BuildContext context) {
    final buttonSize = (MediaQuery.of(context).size.width - 48) / 3;

    return SizedBox(
      height: buttonSize,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: SubscriptionPlanType.values.length,
        separatorBuilder: (_, __) => const Gap(8),
        itemBuilder: (context, index) {
          final plan = SubscriptionPlanType.values[index];
          return SubscriptionTypeButton(
            planType: plan,
            isActive: index == chosenIndex,
            size: buttonSize,
            onTap: () {
              setState(() {
                chosenIndex = index;
              });
            },
          );
        },
      ),
    );
  }
}
