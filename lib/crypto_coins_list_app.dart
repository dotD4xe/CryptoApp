import 'package:flutter/material.dart';
import 'package:test_test/router/router.dart';
import 'package:test_test/theme/theme.dart';

class CryptoCoinsListApp extends StatelessWidget {
  const CryptoCoinsListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: darkTheme,
      routes: routes,
    );
  }
}
