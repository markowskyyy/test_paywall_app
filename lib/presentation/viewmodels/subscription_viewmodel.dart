import 'package:flutter/material.dart';
import 'package:test_paywall_app/data/repositories/subscription_repository_impl.dart';
import 'package:test_paywall_app/domain/entities/subscription.dart';
import 'package:test_paywall_app/domain/entities/subscription_plan_type.dart';


class SubscriptionViewModel extends ChangeNotifier {
  final SubscriptionRepositoryImpl repository;

  Subscription? _subscription;
  bool _isLoading = false;
  SubscriptionPlanType? _selectedPlan;

  SubscriptionViewModel(this.repository) {
    _initialize();
  }

  Subscription? get subscription => _subscription;
  bool get isLoading => _isLoading;
  SubscriptionPlanType? get selectedPlan => _selectedPlan;
  bool get isSubscribed => _subscription?.isSubscribed == true;


  Future<void> _initialize() async {
    await loadSubscription();
  }

  // Загрузка подписки
  Future<void> loadSubscription() async {
    _isLoading = true;
    notifyListeners();

    try {
      _subscription = await repository.getSubscription();
    } catch (e) {
      debugPrint('Error loading subscription: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Выбор плана
  void selectPlan(SubscriptionPlanType planType) {
    _selectedPlan = planType;
    notifyListeners();
  }

  // Покупка выбранного плана
  Future<void> purchaseSelectedPlan() async {
    if (_selectedPlan == null || _isLoading) return;

    _isLoading = true;
    notifyListeners();

    try {
      final newSubscription = Subscription(
        isSubscribed: true,
        planType: _selectedPlan!,
        purchaseDate: DateTime.now(),
      );

      await repository.saveSubscription(newSubscription);
      _subscription = newSubscription;
    } catch (e) {
      debugPrint('Error purchasing: $e');
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> reset() async {
    _isLoading = true;
    notifyListeners();

    try {
      await repository.clearSubscription();
      _subscription = Subscription.empty();
      _selectedPlan = null;
    } catch (e) {
      debugPrint('Error resetting: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

}