import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_paywall_app/data/datasources/local_subscription_datasource.dart';
import 'package:test_paywall_app/data/repositories/subscription_repository_impl.dart';
import 'package:test_paywall_app/domain/entities/subscription_plan_type.dart';
import 'package:test_paywall_app/presentation/viewmodels/subscription_viewmodel.dart';

// Провайдеры для зависимостей
final localDataSourceProvider = Provider<LocalSubscriptionDataSource>(
      (ref) => LocalSubscriptionDataSource(),
);

final subscriptionRepositoryProvider = Provider<SubscriptionRepositoryImpl>(
      (ref) => SubscriptionRepositoryImpl(
    ref.read(localDataSourceProvider),
  ),
);

final subscriptionViewModelProvider = ChangeNotifierProvider<SubscriptionViewModel>(
      (ref) {
    return SubscriptionViewModel(
      ref.read(subscriptionRepositoryProvider),
    );
  },
);


final isSubscribedProvider = Provider<bool>((ref) {
  return ref.watch(subscriptionViewModelProvider
      .select((viewModel) => viewModel.isSubscribed));
});

final selectedPlanProvider = Provider<SubscriptionPlanType?>((ref) {
  return ref.watch(subscriptionViewModelProvider
      .select((viewModel) => viewModel.selectedPlan));
});

final isLoadingProvider = Provider<bool>((ref) {
  return ref.watch(subscriptionViewModelProvider
      .select((viewModel) => viewModel.isLoading));
});