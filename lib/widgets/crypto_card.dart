import 'package:flutter/material.dart';
import '../models/crypto_model.dart';

class CryptoCard extends StatelessWidget {
  const CryptoCard({
    super.key,
    required this.crypto,
  });

  final CryptoModel crypto;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: ListTile(
        title: Padding(
          padding: const EdgeInsets.only(bottom: 20.0, top: 6.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                crypto.name,
                style: const TextStyle(
                  color: Colors.yellow,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 8),
              Row(
                children: [
                  if (crypto.percentChange24h.isNegative)
                    const Icon(Icons.arrow_downward, color: Colors.red),
                  if (!crypto.percentChange24h.isNegative)
                    const Icon(Icons.arrow_upward, color: Colors.green),
                  const SizedBox(width: 5,),
                  Text(
                    '${crypto.percentChange24h.abs().toStringAsFixed(2)}%',
                    style: TextStyle(
                      color: crypto.percentChange24h.isNegative ? Colors.red : Colors.green,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 8),
              Container(
                width: 90,
                decoration: BoxDecoration(
                  color: const Color(0xff303030),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      crypto.coinSymbol,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Price: \$${crypto.priceUSD.toStringAsFixed(2)}',
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(width: 8),
              Text(
                'Rank: ${crypto.cmcRank}',
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(width: 8),
              Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.yellow,
                ),
                child: const Padding(
                  padding: EdgeInsets.all(6.0),
                  child: Icon(
                    Icons.arrow_forward,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}