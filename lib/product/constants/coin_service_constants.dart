enum CoinServicePath { coins }

extension CoinServicePathExtension on CoinServicePath {
  String get urlPath {
    switch (this) {
      case CoinServicePath.coins:
        return "query?market=EUR&symbol=BTC&function=DIGITAL_CURRENCY_DAILY";
    }
  }
}
