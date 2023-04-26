// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_coin.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailCoin _$DetailCoinFromJson(Map<String, dynamic> json) => DetailCoin(
      priceInUSD: (json['PRICE'] as num).toDouble(),
      imageUrl: json['IMAGEURL'] as String,
      toSymbol: json['TOSYMBOL'] as String,
      lastUpdate: DetailCoin._dateTimeFromJson(json['LASTUPDATE'] as int),
      high24Hour: (json['HIGH24HOUR'] as num).toDouble(),
      low24Hours: (json['LOW24HOUR'] as num).toDouble(),
    );

Map<String, dynamic> _$DetailCoinToJson(DetailCoin instance) =>
    <String, dynamic>{
      'TOSYMBOL': instance.toSymbol,
      'PRICE': instance.priceInUSD,
      'IMAGEURL': instance.imageUrl,
      'LASTUPDATE': DetailCoin._dateTimeToJson(instance.lastUpdate),
      'HIGH24HOUR': instance.high24Hour,
      'LOW24HOUR': instance.low24Hours,
    };
