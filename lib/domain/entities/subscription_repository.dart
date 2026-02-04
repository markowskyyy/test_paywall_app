import 'package:test_paywall_app/domain/entities/subscription.dart';

abstract class SubscriptionRepository {
  Future<Subscription> getSubscription();
  Future<void> saveSubscription(Subscription subscription);
  Future<void> clearSubscription();
}