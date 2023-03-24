import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../repositories/crypto_coins/crypto_coins_repository.dart';
import '../widgets/widgets.dart';

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key});

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {


  Future<void> _refreshData() async {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final dio = Dio();
    final cryptoCoinsRepository = CryptoCoinsRepository(dio);
    const coinName = ['BTC', 'ETH', 'BNB', 'SOL', 'DOGE', 'SHIB', 'TRX', 'BUSD', 'XRP'];
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: ListView.separated(
            itemCount: coinName.length,
            separatorBuilder: (context, index) => const Divider(),
            itemBuilder: (context, i) {
              return FutureBuilder<CryptoCompareResponse>(
                future: cryptoCoinsRepository.getPrice(coinName[i], "USD"),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final coin = snapshot.data?.coins[coinName[i]]?["USD"];
                    if (coin != null) {
                      return CryptoCoinTile(
                        coinName: coinName[i],
                        imgUrl: coin.imageUrl,
                        price: coin.price,
                      );
                    } else {
                      return Container(
                        alignment: Alignment.center,
                        height: 100.0,
                        child: const Text("Data unavailable"),
                      );
                    }
                  } else if (snapshot.hasError) {
                    return const Text("error");
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              );
            }
        ),
      ),
    );
  }
}
