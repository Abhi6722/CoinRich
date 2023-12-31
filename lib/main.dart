import 'package:cash_rich/screens/crypto/crypto_provider.dart';
import 'package:cash_rich/screens/crypto/crypto_screen.dart';
import 'package:cash_rich/screens/crypto/crypto_search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CryptoDataNotifier(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      title: 'CoinRich',
      home: CryptoSearchScreen(),
    );
  }
}
