import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:test_test/repositories/crypto_coins_retrofit/api_client.dart';
import 'crypto_coins_list_app.dart';

void main() {
  GetIt.I.registerLazySingleton(() => ApiClient(Dio()));
  runApp(const CryptoCoinsListApp());
}
