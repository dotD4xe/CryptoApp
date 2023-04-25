class DetailCoin {
  final String toSymbol;
  final double priceInUSD;
  final String imageUrl;
  final DateTime lastUpdate;
  final double high24Hour;
  final double low24Hours;

  DetailCoin({
    required this.priceInUSD,
    required this.imageUrl,
    required this.toSymbol,
    required this.lastUpdate,
    required this.high24Hour,
    required this.low24Hours,
  });
}