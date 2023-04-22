part of 'crypto_coin_details_bloc.dart';

abstract class CryptoCoinDetailsEvent {}

class LoadCryptoCoin extends CryptoCoinDetailsEvent {
  LoadCryptoCoin(this.key, {this.completer});
  final String key;
  final Completer? completer;
}
