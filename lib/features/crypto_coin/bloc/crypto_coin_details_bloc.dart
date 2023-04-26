
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_test/repositories/crypto_coin_repository.dart';
import 'package:test_test/repositories/model/coin.dart';

part 'crypto_coin_details_event.dart';
part 'crypto_coin_details_state.dart';

class CryptoCoinDetailsBloc extends Bloc<LoadCryptoCoinEvent, CryptoCoinDetailState> {
  CryptoCoinDetailsBloc() : super(CryptoCoinDetailState()) {
    on<LoadCryptoCoin>(giveCoin);
  }

  void giveCoin(LoadCryptoCoin event, Emitter<CryptoCoinDetailState> emit) async {
    try {
      final cryptoCoin = await CryptoCoinsRepository().getDetailInformation(event.nameCoin);
      emit(CryptoCoinDetailState().copyWith(cryptoCoin: cryptoCoin, isSuccess: true));
    }catch (e) {
      emit(CryptoCoinDetailState().copyWith(error: e.toString()), );
    }
  }
}