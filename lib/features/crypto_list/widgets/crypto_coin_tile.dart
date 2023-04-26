import 'package:flutter/material.dart';

class CryptoCoinTile extends StatelessWidget {
  const CryptoCoinTile({
    super.key,
    required this.coinName,
    required this.price,
    required this.imgUrl,
    required this.open24Hour,
  });

  final String coinName;
  final double price;
  final String imgUrl;
  final double open24Hour;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      leading: Image.network('https://www.cryptocompare.com/$imgUrl'),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            coinName,
            style: theme.textTheme.bodyMedium,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "\$${price.toString()}",
                style: theme.textTheme.bodyMedium,
              ),
              muhammed(price, open24Hour)
            ],
          )
        ],
      ),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {
        Navigator.of(context).pushNamed('/coin', arguments: coinName);
      },
    );
  }

  Widget muhammed(double priceNow, double price24HourAgo) {
    final c = ((priceNow - price24HourAgo) / price24HourAgo) * 100;
    if (c < 0) {
      return Row(
        children: [
          Text(
            '${c.toStringAsFixed(2)}%',
            style: const TextStyle(color: Colors.red),
          ),
          const Icon(Icons.arrow_drop_down_rounded, color: Colors.red,)
        ],
      );
    } else {
      return Row(
        children: [
          Text(
            '${c.toStringAsFixed(2)}%',
            style: const TextStyle(color: Colors.green),
          ),
          const Icon(Icons.arrow_drop_up_rounded, color: Colors.green,)
        ],
      );
    }
  }
}
