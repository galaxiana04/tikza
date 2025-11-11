import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Untuk format harga
import '../models/travel_model.dart';

class DetailScreen extends StatelessWidget {
  final Travel travel;

  DetailScreen({required this.travel});

  final Color maroon = Color(0xFF800000); // Warna merah maroon
  final NumberFormat currencyFormat = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(travel.title, style: TextStyle(color: Colors.white)),
        backgroundColor: maroon,
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 5,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero Image
            Image.asset(travel.imageAsset, width: double.infinity, height: 250, fit: BoxFit.cover),

            // Travel Information
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
              ),
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.only(top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    travel.title,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: maroon),
                  ),
                  SizedBox(height: 8),

                  // Rating and Reviews
                  GestureDetector(
                    onTap: () {
                      _showReviewsDialog(context, travel.reviews);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber.shade700, size: 22),
                        SizedBox(width: 4),
                        Text(
                          "${travel.rating}",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87),
                        ),
                        SizedBox(width: 4),
                        Text(
                          "(${travel.reviews.length} Reviews)",
                          style: TextStyle(fontSize: 14, color: maroon, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8),

                  // Price
                  Text(currencyFormat.format(travel.price),
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green.shade700)),
                  SizedBox(height: 8),

                  // Pax & Type of Trip
                  Row(
                    children: [
                      Icon(Icons.people, color: maroon),
                      SizedBox(width: 8),
                      Text("Max ${travel.pax} People", style: TextStyle(fontSize: 16, color: Colors.black87)),
                      SizedBox(width: 16),
                      Icon(travel.isPrivate ? Icons.lock : Icons.public, color: maroon),
                      SizedBox(width: 8),
                      Text(travel.isPrivate ? "Private Trip" : "Open Trip",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: maroon)),
                    ],
                  ),
                  SizedBox(height: 16),

                  // Description
                  Text(travel.description, style: TextStyle(fontSize: 14, color: Colors.black87), textAlign: TextAlign.justify),
                  SizedBox(height: 16),

                  // Tab View for Included, Excluded, and Terms
                  DefaultTabController(
                    length: 3,
                    child: Column(
                      children: [
                        TabBar(
                          labelColor: maroon,
                          indicatorColor: maroon,
                          unselectedLabelColor: Colors.black54,
                          tabs: [
                            Tab(text: "Included"),
                            Tab(text: "Excluded"),
                            Tab(text: "T&C"),
                          ],
                        ),
                        Container(
                          height: 200, // Tinggi dinamis agar tidak terlalu sempit
                          margin: EdgeInsets.only(top: 10),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
                          ),
                          child: TabBarView(
                            children: [
                              _buildList(travel.included, Icons.check_circle),
                              _buildList(travel.excluded, Icons.cancel),
                              _buildList(travel.terms, Icons.info),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
        ),
        child: ElevatedButton(
          onPressed: () {
            // Booking function
          },
          child: Text("Book Now", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          style: ElevatedButton.styleFrom(
            backgroundColor: maroon,
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 14),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
      ),
    );
  }
void _showReviewsDialog(BuildContext context, List<Map<String, String>> reviews) {
  TextEditingController _commentController = TextEditingController();
  String reviewerName = "Anonymous";

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            title: Text("Reviews", style: TextStyle(fontWeight: FontWeight.bold, color: maroon)),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: reviews.asMap().entries.map((entry) {
                        int index = entry.key;
                        Map<String, String> review = entry.value;
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(review["reviewer"] ?? "Anonymous", style: TextStyle(fontWeight: FontWeight.bold, color: maroon)),
                                    Text(review["review"] ?? "-", style: TextStyle(fontSize: 14, color: Colors.black87)),
                                    Divider(),
                                  ],
                                ),
                              ),
                              IconButton(
                                icon: Icon(Icons.delete, color: Colors.red),
                                onPressed: () {
                                  setState(() {
                                    reviews.removeAt(index);
                                  });
                                },
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: _commentController,
                  decoration: InputDecoration(
                    labelText: "Add Comments",
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 2,
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  if (_commentController.text.isNotEmpty) {
                    setState(() {
                      reviews.add({
                        "reviewer": reviewerName,
                        "review": _commentController.text,
                      });
                    });
                    _commentController.clear();
                  }
                },
                child: Text("Add", style: TextStyle(color: maroon, fontWeight: FontWeight.bold)),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text("Close", style: TextStyle(color: maroon)),
              ),
            ],
          );
        },
      );
    },
  );
}
  // Function to build list of Included, Excluded, and Terms
  Widget _buildList(List<String> items, IconData icon) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items.map((item) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: Colors.green, size: 18),
            SizedBox(width: 8),
            Expanded(
              child: Text(
                item,
                style: TextStyle(fontSize: 14, color: Colors.black87),
              ),
            ),
          ],
        ),
      )).toList(),
    );
  }
}
