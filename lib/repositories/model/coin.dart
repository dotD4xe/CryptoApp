
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:test_test/repositories/model/detail_coin.dart';

part 'coin.g.dart';

@JsonSerializable()
class Coin extends Equatable {

  final String name;
  final DetailCoin details;

  const Coin({
    required this.name,
    required this.details
  });

  @override
  List<Object?> get props => [
    name,
    details,
  ];

}