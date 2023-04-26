part of 'crypto_coin_details_bloc.dart';

class BlocState  {}



class CryptoCoinDetailState extends BlocState {
  final Coin? cryptoCoin;
  final bool isSuccess;
  final bool isLoading;
  final String error;


  CryptoCoinDetailState({
    this.cryptoCoin,
    this.isSuccess = false,
    this.isLoading = false,
    this.error = ""
  });

  CryptoCoinDetailState copyWith({
    Coin? cryptoCoin,
    bool? isSuccess,
    bool? isLoading,
    String? error,
  }) {
    return CryptoCoinDetailState(
        cryptoCoin: cryptoCoin ?? this.cryptoCoin,
        isSuccess: isSuccess ?? this.isSuccess,
        isLoading: isLoading ?? this.isLoading,
        error: error ?? this.error
    );
  }
}