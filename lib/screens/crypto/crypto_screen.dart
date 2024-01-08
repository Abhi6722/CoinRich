import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/crypto_card.dart';
import 'crypto_provider.dart';

class CryptoScreen extends StatefulWidget {

  final String? searchTerm;
  const CryptoScreen({super.key, this.searchTerm});

  @override
  State<CryptoScreen> createState() => _CryptoScreenState();
}

class _CryptoScreenState extends State<CryptoScreen> {

  @override
  void initState() {
    super.initState();
    context.read<CryptoDataNotifier>().fetchCryptoSearchData(widget.searchTerm);
  }

  @override
  Widget build(BuildContext context) {
    final cryptoData = context.watch<CryptoDataNotifier>().cryptoData;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text(
          "CoinRich",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  children: [
                    Icon(Icons.pie_chart, color: Colors.yellow,),
                    SizedBox(width: 10,),
                    Text("Show Chart", style: TextStyle(color: Colors.yellow),),
                  ],
                ),
                Text("Count: ${cryptoData.length}"),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cryptoData.length,
              padding: const EdgeInsets.all(8.0),
              itemBuilder: (context, index) {
                final crypto = cryptoData[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: CryptoCard(crypto: crypto),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}