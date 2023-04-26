// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Coin _$CoinFromJson(Map<String, dynamic> json) => Coin(
      name: json['name'] as String,
      details: DetailCoin.fromJson(json['details'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CoinToJson(Coin instance) => <String, dynamic>{
      'name': instance.name,
      'details': instance.details,
    };
