import 'package:flutter/material.dart';

class CryptoCoinTile extends StatelessWidget {
  const CryptoCoinTile({super.key,
    required this.coinName,
    required this.price,
    required this.imgUrl
  });

  final String coinName;
  final double? price;
  final String? imgUrl;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      leading:
        Image.network('https://www.cryptocompare.com/$imgUrl'),

      title: Text(
        coinName,
        style: theme.textTheme.bodyMedium,
      ),

      subtitle: Container(
        alignment: AlignmentDirectional.topStart,
        child: Text(price.toString(), style: theme.textTheme.labelSmall)
      ),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {
        Navigator.of(context).pushNamed('/coin', arguments: coinName);
      },
    );
  }
}
