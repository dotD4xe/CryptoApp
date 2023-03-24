
import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

part 'crypto_coins_repository.g.dart';

@RestApi(baseUrl: "https://min-api.cryptocompare.com/data")
abstract class CryptoCoinsRepository {
  factory CryptoCoinsRepository(Dio dio) = _CryptoCoinsRepository;

  @GET("/pricemultifull")
  Future<CryptoCompareResponse> getPrice(
    @Query("fsyms") String fromSymbol,
    @Query("tsyms") String toSymbol
    );
}

@JsonSerializable()
class CryptoCompareResponse {
  @JsonKey(name: "RAW")
  Map<String, Map<String, Coin>> coins;

  CryptoCompareResponse({required this.coins});

  factory CryptoCompareResponse.fromJson(Map<String, dynamic> json) =>
      _$CryptoCompareResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CryptoCompareResponseToJson(this);
}

@JsonSerializable()
class Coin {
  @JsonKey(name: "PRICE")
  double price;

  @JsonKey(name: "IMAGEURL")
  String imageUrl;

  Coin({required this.price,
        required this.imageUrl
      });

  factory Coin.fromJson(Map<String, dynamic> json) => _$CoinFromJson(json);
  Map<String, dynamic> toJson() => _$CoinToJson(this);
}
