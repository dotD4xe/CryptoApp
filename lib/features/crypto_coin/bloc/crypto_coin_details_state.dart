part of 'crypto_coin_details_bloc.dart';

abstract class CryptoCoinDetailsState {}

class CryptoCoinDetailsInitial extends CryptoCoinDetailsState {}

class CryptoCoinDetailsLoading extends CryptoCoinDetailsState{}

class CryptoCoinDetailsSuccess extends CryptoCoinDetailsState{
  CryptoCoinDetailsSuccess ({
    required this.cryptoCoin,
  });
  final DetailCoin cryptoCoin;
}

class CryptoCoinDetailsFailure extends CryptoCoinDetailsState{
  CryptoCoinDetailsFailure({required this.exception});

  final Object? exception;
}