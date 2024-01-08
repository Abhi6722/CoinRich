import 'package:flutter/material.dart';
import '../../models/crypto_model.dart';

class CryptoDataNotifier with ChangeNotifier {
  final CryptoRepository _cryptoRepository = CryptoRepository();
  List<CryptoModel> _cryptoData = [];

  List<CryptoModel> get cryptoData => _cryptoData;

  Future<void> fetchCryptoData() async {
    try {
      _cryptoData = await _cryptoRepository.getCryptoData();
      debugPrint('Crypto data fetched: $_cryptoData');
      notifyListeners();
    } catch (e) {
      debugPrint('Error fetching data: $e');
    }
  }

  Future<void> fetchCryptoSearchData(String? searchTerm) async {
    try {
      _cryptoData = await _cryptoRepository.getSearchCryptoData(searchTerm);
      debugPrint('Crypto data fetched: $_cryptoData');
      notifyListeners();
    } catch (e) {
      debugPrint('Error fetching data: $e');
    }
  }
}