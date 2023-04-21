
import 'package:get_it/get_it.dart';
import 'package:test_test/model/crypto_coin.dart';
import 'crypto_coins_retrofit/api_client.dart';

class CryptoCoinsRepository {
  Future<List<Coin>> getCoinsList() async {
    final response = await GetIt.I<ApiClient>().getPrice('BTC,ETH,BNB,SOL,DOGE,SHIB,TRX,BUSD,XRP', "USD");
    final data = response.coins;
    final listCoins = data.entries
        .map((e) {
      final usdData = e.value['USD'] as Map<String, dynamic>;
      final price = usdData['PRICE'];
      final imageUrl = usdData['IMAGEURL'];
      return Coin(
          name: e.key,
          priceInUSD: price,
          imageUrl: imageUrl);
    }).toList();
    return listCoins;
  }
}