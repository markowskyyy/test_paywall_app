import 'package:flutter/material.dart';
import 'package:test_paywall_app/design.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color backgroundColor;
  final Color textColor;

  const CustomButton._({
    super.key,
    required this.onTap,
    required this.text,
    required this.backgroundColor,
    required this.textColor,
  });

  factory CustomButton({
    Key? key,
    required String text,
    required VoidCallback onTap,
  }) {
    return CustomButton._(
      key: key,
      text: text,
      onTap: onTap,
      backgroundColor: Colors.white,
      textColor: AppColors.black,
    );
  }

  factory CustomButton.dark({
    Key? key,
    required String text,
    required VoidCallback onTap,
  }) {
    return CustomButton._(
      key: key,
      text: text,
      onTap: onTap,
      backgroundColor: AppColors.darkWine,
      textColor: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 56,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(28),
        ),
        child: Text(
          text,
          style: nMediumTextStyle.copyWith(color: textColor),
        ),
      ),
    );
  }
}
