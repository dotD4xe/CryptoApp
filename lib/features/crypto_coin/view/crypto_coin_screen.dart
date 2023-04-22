import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_test/features/crypto_coin/bloc/crypto_coin_details_bloc.dart';

class CryptoCoinScreen extends StatefulWidget {
  const CryptoCoinScreen({super.key});

  @override
  State<CryptoCoinScreen> createState() => _CryptoCoinScreenState();
}

class _CryptoCoinScreenState extends State<CryptoCoinScreen> {
  String? coinName;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)?.settings.arguments;
    assert(args != null && args is String, "args not a String or it is null");
    coinName = args as String;
    _cryptoCoinBloc.add(LoadCryptoCoin(coinName!));
  }

  final _cryptoCoinBloc = CryptoCoinDetailsBloc();

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<CryptoCoinDetailsBloc, CryptoCoinDetailsState>(
        bloc: _cryptoCoinBloc,
        builder: (context, state) {
          if (state is CryptoCoinDetailsSuccess) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      width: 160,
                      height: 160,
                      child: Image.network(
                          'https://www.cryptocompare.com/${state.cryptoCoin.imageUrl}'),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      coinName!,
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.all(16),
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(16.0),
                        ),
                        color: Color.fromARGB(255, 21, 21, 21),
                      ),
                      child: Center(
                        child: Text(
                          "${state.cryptoCoin.priceInUSD.toString()} \$",
                          style: const TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.all(16),
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(16.0),
                        ),
                        color: Color.fromARGB(255, 21, 21, 21),
                      ),
                      child: Column(
                        children: [
                          DataRow(
                            text: 'High 24 Hour',
                            price: state.cryptoCoin.high24Hour,
                          ),
                          DataRow(
                            text: 'Low 24 Hour',
                            price: state.cryptoCoin.low24Hours,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class DataRow extends StatelessWidget {
  const DataRow({
    Key? key,
    required this.text,
    required this.price,
  }) : super(key: key);

  final String text;
  final double price;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text),
        const SizedBox(height: 26),
        Flexible(child: Text("${price.toStringAsFixed(6)} \$"))
      ],
    );
  }
}
