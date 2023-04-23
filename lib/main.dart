import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:test_test/firebase_options.dart';
import 'package:test_test/repositories/crypto_coins_retrofit/api_client.dart';
import 'crypto_coins_list_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GetIt.I.registerLazySingleton(() => ApiClient(Dio()));

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const CryptoCoinsListApp());
}
