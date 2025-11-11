import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; 
import '../models/travel_model.dart';

class TravelCard extends StatelessWidget {
  final Travel travel;
  final VoidCallback onTap;

  const TravelCard({Key? key, required this.travel, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currencyFormat = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);

    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.asset(travel.imageAsset, width: double.infinity, height: 160, fit: BoxFit.cover),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    travel.title,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
                  ),
                  const SizedBox(height: 6),

                  Text(
                    currencyFormat.format(travel.price),
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.green),
                  ),

                  const SizedBox(height: 6),

                  Row(
                    children: [
                      Icon(
                        travel.isPrivate ? Icons.lock : Icons.public,
                        color: const Color(0xFF800000), 
                        size: 18,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        travel.isPrivate ? "Private Trip" : "Open Trip",
                        style: const TextStyle( 
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF800000),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
