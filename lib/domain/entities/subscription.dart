import 'package:flutter/material.dart';
import 'subscription_plan_type.dart';

@immutable
class Subscription {
  final bool isSubscribed;
  final DateTime? purchaseDate;
  final SubscriptionPlanType planType;

  const Subscription({
    required this.isSubscribed,
    this.purchaseDate,
    this.planType = SubscriptionPlanType.monthly,
  });

  factory Subscription.empty() => const Subscription(isSubscribed: false);

  Subscription copyWith({
    bool? isSubscribed,
    DateTime? purchaseDate,
    SubscriptionPlanType? planType,
  }) {
    return Subscription(
      isSubscribed: isSubscribed ?? this.isSubscribed,
      purchaseDate: purchaseDate ?? this.purchaseDate,
      planType: planType ?? this.planType,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'isSubscribed': isSubscribed,
      'purchaseDate': purchaseDate?.toIso8601String(),
      'planType': planType.toJson(),
    };
  }

  factory Subscription.fromMap(Map<String, dynamic> map) {
    return Subscription(
      isSubscribed: map['isSubscribed'] ?? false,
      purchaseDate: map['purchaseDate'] != null
          ? DateTime.tryParse(map['purchaseDate'])
          : null,
      // Используем fromJson() из enum
      planType: SubscriptionPlanType.fromJson(map['planType'])
          ?? SubscriptionPlanType.monthly,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Subscription &&
        other.isSubscribed == isSubscribed &&
        other.purchaseDate == purchaseDate &&
        other.planType == planType;
  }

  @override
  int get hashCode =>
      isSubscribed.hashCode ^ purchaseDate.hashCode ^ planType.hashCode;
}