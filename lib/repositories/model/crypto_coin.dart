
import 'package:equatable/equatable.dart';

class Coin extends Equatable {
  final String name;
  final double priceInUSD;
  final String imageUrl;

  const Coin({
    required this.name,
    required this.priceInUSD,
    required this.imageUrl
  });

  @override
  List<Object?> get props => [
    name,
    priceInUSD,
    imageUrl
  ];

}