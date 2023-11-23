import '../services/crypto_services.dart';

class CryptoModel {
  final String name;
  final double percentChange24h;
  final int cmcRank;
  final double priceUSD;
  final String coinSymbol;

  CryptoModel({
    required this.name,
    required this.percentChange24h,
    required this.cmcRank,
    required this.priceUSD,
    required this.coinSymbol,
  });
}

class CryptoRepository {
  final CryptoService _cryptoService = CryptoService();

  Future<List<CryptoModel>> getCryptoData() async {
    final Map<String, dynamic> data = await _cryptoService.fetchCryptoData();
    final List<CryptoModel> cryptoData = [];

    if (data.containsKey('data')) {
      final Map<String, dynamic> coinsData = data['data'];
      coinsData.forEach((key, value) {
        final coinData = value as Map<String, dynamic>;
        final name = coinData['name'];
        final percentChange24h = coinData['quote']['USD']['percent_change_24h'];
        final cmcRank = coinData['cmc_rank'];
        final priceUSD = coinData['quote']['USD']['price'];
        final coinSymbol = coinData['symbol'];

        cryptoData.add(CryptoModel(
          name: name,
          percentChange24h: percentChange24h,
          cmcRank: cmcRank,
          priceUSD: priceUSD,
          coinSymbol: coinSymbol,
        ));
      });
    }

    return cryptoData;
  }
}
