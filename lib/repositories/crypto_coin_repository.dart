
import 'package:get_it/get_it.dart';
import 'package:test_test/repositories/model/crypto_coin.dart';
import 'package:test_test/repositories/model/crypto_coin_detail.dart';
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

  Future<DetailCoin> getDetailInformation(String key) async{
    final response = await GetIt.I<ApiClient>().getPrice(key, "USD");
    final data = response.coins;
    final coinData = data[key] as Map<String, dynamic>;
    final result = coinData['USD'] as Map<String, dynamic>;
    final toSymbol = result['TOSYMBOL'];
    final priceInUSD = result['PRICE'];
    final imageUrl = result['IMAGEURL'];
    final lastUpdate = DateTime.fromMillisecondsSinceEpoch(result['LASTUPDATE']);
    final high24Hour = result['HIGH24HOUR'];
    final low24Hours = result['LOW24HOUR'];
    return DetailCoin(
      toSymbol: toSymbol,
      priceInUSD: priceInUSD,
      lastUpdate: lastUpdate,
      imageUrl: imageUrl,
      low24Hours: low24Hours,
      high24Hour: high24Hour,
    );
  }
}