import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_paywall_app/design.dart';
import 'package:test_paywall_app/gen/assets.gen.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;

  const CustomButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 56,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(28),
        ),
        child: Text(
            'Оплатить подписку',
            style: nMediumTextStyle.copyWith(color: AppColors.black),
        )
      ),
    );
  }
}
