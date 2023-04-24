part of 'crypto_coin_details_bloc.dart';

class BlocEvent {}

class LoadCryptoCoinEvent extends BlocEvent {
  LoadCryptoCoinEvent._();

  factory LoadCryptoCoinEvent.init() => LoadCryptoCoinInit();

  factory LoadCryptoCoinEvent.loadCryptoList(String nameCoin) => LoadCryptoCoin(nameCoin);
}

class LoadCryptoCoinInit extends LoadCryptoCoinEvent {
  LoadCryptoCoinInit() : super._();
}

class LoadCryptoCoin extends LoadCryptoCoinEvent {
  final String nameCoin;

  LoadCryptoCoin(this.nameCoin) : super._();
}
