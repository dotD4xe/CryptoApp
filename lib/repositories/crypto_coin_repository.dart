
import 'package:get_it/get_it.dart';
import 'package:test_test/repositories/model/coin.dart';
import 'package:test_test/repositories/model/detail_coin.dart';
import 'crypto_coins_retrofit/api_client.dart';

class CryptoCoinsRepository {
  Future<List<Coin>> getCoinsList() async {
    final response = await GetIt.I<ApiClient>().getPrice('BTC,ETH,BNB,SOL,DOGE,SHIB,TRX,BUSD,XRP', "USD");
    final data = response.coins;

    final listCoins = data.entries.map((e) {
      final usdData =
      (e.value as Map<String, dynamic>)['USD'] as Map<String, dynamic>;
      final details = DetailCoin.fromJson(usdData);
      return Coin(name: e.key, details: details);
    }).toList();

    return listCoins;
  }

  Future<Coin> getDetailInformation(String key) async{
    final response = await GetIt.I<ApiClient>().getPrice(key, "USD");
    final data = response.coins;
    final coinData = (data[key] as Map<String, dynamic>)['USD'] as Map<String, dynamic>;
    final coinDetail = DetailCoin.fromJson(coinData);
    return Coin(name: key, details: coinDetail);
  }
}