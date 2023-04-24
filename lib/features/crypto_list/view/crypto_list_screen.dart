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
      body: RefreshIndicator(
        onRefresh: () async {
          _cryptoListBloc.add(LoadCryptoList());
        },
        child: BlocBuilder<CryptoListBloc, CryptoListState>(
            bloc: _cryptoListBloc, builder: _buildBody),
      ),
    );
  }

  Widget _buildBody(BuildContext context, CryptoListState state) {
    if (state.isSuccess) {
      return _buildData(state);
    }
    if (state.error.isNotEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Uuuups',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              "Please try again later",
              style: Theme.of(context)
                  .textTheme
                  .labelSmall
                  ?.copyWith(fontSize: 16),
            ),
            const SizedBox(height: 30),
            TextButton(
              onPressed: () {
                _cryptoListBloc.add(LoadCryptoList());
              },
              child: const Text('Try again'),
            )
          ],
        ),
      );
    }
    return _buildProgressIndicator();
  }

  Widget _buildData(CryptoListState state) {
    return ListView.separated(
      itemCount: state.cryptoList.length,
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (context, i) {
        var coin = state.cryptoList[i];
        return CryptoCoinTile(
            coinName: coin.name, price: coin.priceInUSD, imgUrl: coin.imageUrl);
      },
    );
  }

  Widget _buildProgressIndicator() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
