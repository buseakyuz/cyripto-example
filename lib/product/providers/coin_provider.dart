import 'package:flutter/material.dart';
import 'package:trading_app/product/models/coin_data.dart';
import 'package:trading_app/product/services/coin_service.dart';

enum CoinProviderState { idle, fetching, pushing, processing }

class CoinProvider with ChangeNotifier {
  final CoinService _coinService = CoinService();
  CoinProviderState _state = CoinProviderState.idle;
  CoinData? myCoin;

  CoinProviderState get state => _state;
  set state(CoinProviderState state) {
    _state = state;
    notifyListeners();
  }

  Future<void> fetchCoin() async {
    state = CoinProviderState.fetching;
    var response = await _coinService.fetchCoin();
    if (response != null) {
      myCoin = response;
    }
    state = CoinProviderState.idle;
  }
}
