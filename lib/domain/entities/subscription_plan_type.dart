enum SubscriptionPlanType {
  monthly(price: 199.0, displayName: 'Месячная'),
  yearly(price: 1490.0, displayName: 'Годовая');

  final double price;
  final String displayName;

  const SubscriptionPlanType({
    required this.price,
    required this.displayName,
  });

  String toJson() => name;

  static SubscriptionPlanType? fromJson(String? json) {
    if (json == null) return null;
    try {
      return SubscriptionPlanType.values.firstWhere(
            (type) => type.name == json,
      );
    } catch (_) {
      return null;
    }
  }

  double get discountPercentage {
    if (this == yearly) {
      final monthlyTotal = monthly.price * 12;
      return ((monthlyTotal - price) / monthlyTotal * 100).roundToDouble();
    }
    return 0;
  }

  String get period {
    switch (this) {
      case SubscriptionPlanType.monthly:
        return 'в месяц';
      case SubscriptionPlanType.yearly:
        return 'в год';
    }
  }
}