import 'package:test_paywall_app/data/datasources/local_subscription_datasource.dart';
import 'package:test_paywall_app/domain/entities/subscription.dart';
import 'package:test_paywall_app/domain/entities/subscription_repository.dart';

class SubscriptionRepositoryImpl implements SubscriptionRepository {
  final LocalSubscriptionDataSource dataSource;

  SubscriptionRepositoryImpl(this.dataSource);

  @override
  Future<Subscription> getSubscription() async {
    try {
      final data = await dataSource.getSubscription();
      return data != null
          ? Subscription.fromMap(data)
          : const Subscription(isSubscribed: false);
    } catch (_) {
      return const Subscription(isSubscribed: false);
    }
  }

  @override
  Future<void> saveSubscription(Subscription subscription) async {
    await dataSource.saveSubscription(subscription.toMap());
  }

  @override
  Future<void> clearSubscription() async {
    await dataSource.clearSubscription();
  }
}