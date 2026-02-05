enum SubscriptionPlanType {
  weekly(price: 149.0, displayName: 'Неделя'),
  monthly(price: 499.0, displayName: 'Месяц'),
  yearly(price: 3890.0, displayName: 'Год');

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

  String get displayNameLover => displayName.toLowerCase();

  double get discountPercentage {
    if (this == yearly) {
      final monthlyTotal = monthly.price * 12;
      return ((monthlyTotal - price) / monthlyTotal * 100).roundToDouble();
    }
    return 0;
  }

  double get pricePerYear{
    if (this == weekly) {
      return price * 52;
    } else if (this == monthly) {
      return price * 12;
    }
    return price;
  }

  String get period {
    switch (this) {
      case SubscriptionPlanType.weekly:
        return 'в неделю';
      case SubscriptionPlanType.monthly:
        return 'в месяц';
      case SubscriptionPlanType.yearly:
        return 'в год';
    }
  }
}