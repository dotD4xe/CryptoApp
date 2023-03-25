
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:test_test/repositories/crypto_coins_retrofit/api_client.dart';
import '../widgets/widgets.dart';

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key});

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {

  final coinName = ['BTC', 'ETH', 'BNB', 'SOL', 'DOGE', 'SHIB', 'TRX', 'BUSD', 'XRP'];

  Future<void> _refreshData() async {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: FutureBuilder<CryptoCompareResponse>(
          future: GetIt.I<ApiClient>().getPrice(coinName.map((i) => i.toString()).join(","), "USD"),
          builder: (context, snapshot) {
            return _buildBody(snapshot);
          },
        ),
      ),
    );
  }

  Widget _buildBody(AsyncSnapshot<CryptoCompareResponse> snapshot) {
    if(snapshot.hasData) {
      final coins = snapshot.data?.coins;
      return _buildData(coins);
    }
    if(snapshot.hasError) return const Text('error');
    return _buildProgressIndicator();
  }

  Widget _buildData(coins) {
    if (coins != null) {
      return ListView.separated(
        itemCount: coinName.length,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, i) {
          var coin = coins[coinName[i]]?['USD'];
          return CryptoCoinTile(coinName: coinName[i], price: coin.price,imgUrl: coin.imageUrl);
        }
      );
    } else{
      return Container(
        alignment: Alignment.center,
        height: 100.0,
        child: const Text("Data unavailable"),
      );
    }
  }

  Widget _buildProgressIndicator() => const Center(
    child: CircularProgressIndicator(),
  );

}
