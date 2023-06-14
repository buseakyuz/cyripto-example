import 'package:dio/dio.dart';
import 'package:trading_app/product/constants/coin_service_constants.dart';
import 'package:trading_app/product/constants/database_constants.dart';
import 'package:trading_app/product/models/coin_data.dart';

class CoinService {
  Dio dio = Dio(BaseOptions(baseUrl: DatabaseConstants.baseUrl, headers: {
    'X-RapidAPI-Key': 'e274fe8ff5msheafca019a023848p16341ejsnc83883ec5e68',
    'X-RapidAPI-Host': 'alpha-vantage.p.rapidapi.com'
  }));

  Future<CoinData?> fetchCoin() async {
    try {
      var response = await dio.get(
        CoinServicePath.coins.urlPath,
      );
      print(response.requestOptions.uri);
      return CoinData.fromJson(response.data);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
