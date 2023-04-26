import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'detail_coin.g.dart';

@JsonSerializable()
class DetailCoin extends Equatable {
  @JsonKey(name: "TOSYMBOL")
  final String toSymbol;

  @JsonKey(name: "PRICE")
  final double priceInUSD;

  @JsonKey(name: "IMAGEURL")
  final String imageUrl;

  @JsonKey(
    name: "LASTUPDATE",
    toJson: _dateTimeToJson,
    fromJson: _dateTimeFromJson,
  )
  final DateTime lastUpdate;

  @JsonKey(name: "HIGH24HOUR")
  final double high24Hour;

  @JsonKey(name: "LOW24HOUR")
  final double low24Hours;

  const DetailCoin({
    required this.priceInUSD,
    required this.imageUrl,
    required this.toSymbol,
    required this.lastUpdate,
    required this.high24Hour,
    required this.low24Hours,
  });

  factory DetailCoin.fromJson(Map<String, dynamic> json) =>
      _$DetailCoinFromJson(json);
  Map<String, dynamic> toJson() => _$DetailCoinToJson(this);

  static int _dateTimeToJson(DateTime time) => time.millisecondsSinceEpoch;

  static DateTime _dateTimeFromJson(int milliseconds) =>
      DateTime.fromMillisecondsSinceEpoch(milliseconds);

  @override
  List<Object?> get props => [
        toSymbol,
        priceInUSD,
        imageUrl,
        lastUpdate,
        high24Hour,
        low24Hours,
      ];
}
