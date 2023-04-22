import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_test/model/crypto_coin_detail.dart';
import 'package:test_test/repositories/crypto_coin_repository.dart';

part 'crypto_coin_details_event.dart';
part 'crypto_coin_details_state.dart';

class CryptoCoinDetailsBloc extends Bloc<CryptoCoinDetailsEvent, CryptoCoinDetailsState> {
  CryptoCoinDetailsBloc() : super(CryptoCoinDetailsInitial()) {
    on<LoadCryptoCoin>((event, emit) async{
      try {
        if (state is! CryptoCoinDetailsSuccess) {
          emit(CryptoCoinDetailsLoading());
        }
        final cryptoCoin = await CryptoCoinsRepository().getDetailInformation(event.key);
        emit(CryptoCoinDetailsSuccess(cryptoCoin: cryptoCoin));
      }catch (e) {
        emit(CryptoCoinDetailsFailure(exception: e));
      }
      // finally {
      //   event.completer?.complete();
      // }
    });
  }
}
