part of 'crypto_list_bloc.dart';

class CryptoListState {}

class CryptoListInitial extends CryptoListState{}

class CryptoListLoading extends CryptoListState{}

class CryptoListSuccess extends CryptoListState{
  CryptoListSuccess ({
    required this.cryptoList,
  });
  final List<Coin> cryptoList;
}

class CryptoListFailure extends CryptoListState{}