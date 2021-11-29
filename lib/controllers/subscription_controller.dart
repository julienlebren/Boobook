import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:subscription_service/subscription_service.dart';

part 'subscription_controller.freezed.dart';

@freezed
class SubscriptionState with _$SubscriptionState {
  const factory SubscriptionState({
    String? price,
    @Default(false) bool isReady,
    @Default(false) bool isLoading,
    @Default(false) bool isSuccess,
    String? errorText,
  }) = _SubscriptionState;
}

@freezed
class SubscriptionEvent with _$SubscriptionEvent {
  const factory SubscriptionEvent.fetchOfferings() = _FetchOfferings;
  const factory SubscriptionEvent.purchase() = _Purchase;
  const factory SubscriptionEvent.restorePurchases() = _RestorePurchases;
  const factory SubscriptionEvent.openOffers() = _OpenOffers;
}

class SubscriptionController extends StateNotifier<SubscriptionState> {
  SubscriptionController(
    this._service,
  ) : super(SubscriptionState()) {
    _fetchOfferings();
  }

  final SubscriptionService _service;

  void handleEvent(SubscriptionEvent event) {
    event.when(
      fetchOfferings: _fetchOfferings,
      purchase: _purchase,
      restorePurchases: _restorePurchases,
      openOffers: _openOffers,
    );
  }

  Future<void> _fetchOfferings() async {
    try {
      await _service.fetchOfferings();
      state = state.copyWith(
        isReady: true, //_service.subscription != null,
        price: _service.subscription?.product.priceString,
      );
    } catch (e) {
      state = state.copyWith(errorText: e.toString());
    }
  }

  Future<void> _purchase() async {
    state = state.copyWith(isLoading: true);
    try {
      await _service.purchase();
      state = state.copyWith(isSuccess: true);
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorText: e.toString(),
      );
    }
  }

  Future<void> _restorePurchases() async {
    state = state.copyWith(isLoading: true);
    try {
      await _service.purchase();
      state = state.copyWith(isSuccess: true);
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorText: e.toString(),
      );
    }
  }

  Future<void> _openOffers() async {
    await _service.openOffers();
  }
}
