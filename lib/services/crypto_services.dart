import 'dart:convert';
import 'package:cash_rich/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class CryptoService {
  Future<Map<String, dynamic>> fetchCryptoData() async {
    final url = Uri.parse(cryptoApiUrl);
    final response = await http.get(url, headers: {
      'X-CMC_PRO_API_KEY': apiKey,
    });

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  Future<Map<String, dynamic>> fetchSearchCryptoData(String? searchTerm) async {
    debugPrint("search ");
    String cryptoApiUrl = 'https://pro-api.coinmarketcap.com/v1/cryptocurrency/quotes/latest?symbol=$searchTerm';
    debugPrint(cryptoApiUrl);
    final url = Uri.parse(cryptoApiUrl);
    final response = await http.get(url, headers: {
      'X-CMC_PRO_API_KEY': apiKey,
    });

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}