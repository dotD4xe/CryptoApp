part of 'crypto_list_bloc.dart';

abstract class BlocState extends Equatable {}

class CryptoListState extends BlocState {
  final List<Coin> cryptoList;
  final bool isSuccess;
  final bool isLoading;
  final String error;


  CryptoListState({
    this.cryptoList = const [],
    this.isSuccess = false,
    this.isLoading = false,
    this.error = ""
  });

  CryptoListState copyWith({
    List<Coin>? cryptoList,
    bool? isSuccess,
    bool? isLoading,
    String? error,
  }) {
    return CryptoListState(
      cryptoList: cryptoList ?? this.cryptoList,
      isSuccess: isSuccess ?? this.isSuccess,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error
    );
  }

  @override
  List<Object?> get props => [
    cryptoList,
    isSuccess,
    isLoading,
    error
  ];
}
