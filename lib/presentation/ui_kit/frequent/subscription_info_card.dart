import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_paywall_app/design.dart';
import 'package:test_paywall_app/gen/assets.gen.dart';
import 'package:test_paywall_app/presentation/ui_kit/ui_kit.dart';

class SubscriptionInfoCard extends StatelessWidget {
  final String svgPath;
  final String title;
  final String text;

  const SubscriptionInfoCard._({
    super.key,
    required this.svgPath,
    required this.title,
    required this.text,
  });

  /// Бесплатные сообщения
  factory SubscriptionInfoCard.messages({Key? key}) {
    return SubscriptionInfoCard._(
      key: key,
      svgPath: Assets.svgs.messages2,
      title: 'Бесплатные смс',
      text: 'Неограниченное общение с полной конфиденциальностью чатов',
    );
  }

  /// Поиск по интересам
  factory SubscriptionInfoCard.search({Key? key}) {
    return SubscriptionInfoCard._(
      key: key,
      svgPath: Assets.svgs.heartSearch,
      title: 'Умный поиск',
      text: 'Подбор людей по интересам, целям и предпочтениям',
    );
  }

  /// Скидки и бонусы
  factory SubscriptionInfoCard.discount({Key? key}) {
    return SubscriptionInfoCard._(
      key: key,
      svgPath: Assets.svgs.ticketDiscount,
      title: 'Эксклюзивные скидки',
      text: 'Доступ к специальным предложениям и бонусам подписки',
    );
  }

  /// Аналитика и безопасность
  factory SubscriptionInfoCard.research({Key? key}) {
    return SubscriptionInfoCard._(
      key: key,
      svgPath: Assets.svgs.microscope,
      title: 'Повышенная безопасность',
      text: 'Углублённая проверка профилей и защита личных данных',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: AppColors.grey, width: 1),
        color: AppColors.darkWine,
      ),
      child: Row(
        children: [
          Container(
            height: 48,
            width: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColors.grey.withAlpha(100),
            ),
            padding: EdgeInsets.all(8),
            child: SvgPicture.asset(svgPath),
          ),
          const Gap(12),
          SizedBox(
            width: MediaQuery.of(context).size.width - 156,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: bMediumTextStyle,
                ),
                Text(
                  text,
                  style: nLightTextStyle,
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
