
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_test/repositories/crypto_coin_repository.dart';
import 'package:test_test/repositories/model/coin.dart';

part 'crypto_list_event.dart';
part 'crypto_list_state.dart';

class CryptoListBloc extends Bloc<LoadCryptoListEvent, CryptoListState> {
  CryptoListBloc() : super(CryptoListState()) {
    on<LoadCryptoList>(giveCoins);
  }

  void giveCoins(LoadCryptoList event, Emitter<CryptoListState> emit) async {
    try {
      final cryptoCoinsList = await CryptoCoinsRepository().getCoinsList();
      emit(CryptoListState().copyWith(cryptoList: cryptoCoinsList, isSuccess: true));
    }catch (e) {
      emit(CryptoListState().copyWith(error: e.toString()), );
    }
  }
}


