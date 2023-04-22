import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_test/model/crypto_coin.dart';
import 'package:test_test/repositories/crypto_coin_repository.dart';

part 'crypto_list_event.dart';
part 'crypto_list_state.dart';

class CryptoListBloc extends Bloc<CryptoListEvent, CryptoListState> {
  CryptoListBloc() : super(CryptoListInitial()) {
    on<LoadCryptoList>((event, emit) async{
      try {
        if (state is! CryptoListSuccess) {
          emit(CryptoListLoading());
        }
        final cryptoCoinsList = await CryptoCoinsRepository().getCoinsList();
        emit(CryptoListSuccess(cryptoList: cryptoCoinsList));
      }catch (e) {
        emit(CryptoListFailure(exception: e));
      }
      finally {
        event.completer?.complete();
      }
    });
  }
}