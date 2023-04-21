
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_test/features/crypto_list/bloc/crypto_list_bloc.dart';
import '../widgets/widgets.dart';

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key});

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {

  final _cryptoListBloc = CryptoListBloc();

  @override
  void initState() {
    _cryptoListBloc.add(LoadCryptoList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        centerTitle: true,
      ),
      body: BlocBuilder<CryptoListBloc, CryptoListState>(
        bloc: _cryptoListBloc,
        builder: (context, state) {
          if (state is CryptoListSuccess) {
            return ListView.separated(
              itemCount: state.cryptoList.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, i) {
                var coin = state.cryptoList[i];
                return CryptoCoinTile(coinName: coin.name, price: coin.priceInUSD,imgUrl: coin.imageUrl);
              }
            );
          }
          return const Center(child: CircularProgressIndicator(),);
        },
      ),
    );
  }
 }
