part of 'crypto_list_bloc.dart';

abstract class BlocEvent {}

class LoadCryptoListEvent extends BlocEvent {
  LoadCryptoListEvent._();

  factory LoadCryptoListEvent.init() => LoadCryptoListInit();

  factory LoadCryptoListEvent.loadCryptoList() => LoadCryptoList();
}

class LoadCryptoListInit extends LoadCryptoListEvent {
  LoadCryptoListInit() : super._();
}

class LoadCryptoList extends LoadCryptoListEvent {
  LoadCryptoList() : super._();
}