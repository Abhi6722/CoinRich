import 'package:cash_rich/screens/crypto/crypto_screen.dart';
import 'package:flutter/material.dart';

class CryptoSearchScreen extends StatefulWidget {
  const CryptoSearchScreen({super.key});

  @override
  State<CryptoSearchScreen> createState() => _CryptoSearchScreenState();
}

class _CryptoSearchScreenState extends State<CryptoSearchScreen> {

  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search Coins"),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: "Enter Coins"
              ),
              controller: searchController,
            ),
            ElevatedButton(
                onPressed: (){
                  debugPrint(searchController.text);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CryptoScreen(searchTerm: searchController.text),
                    )
                  );
                  },
                child: Text("Search"))
          ],
        ),
      ),
    );
  }
}
