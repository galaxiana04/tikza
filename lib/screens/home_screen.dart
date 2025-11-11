import 'package:flutter/material.dart';
import '../models/travel_model.dart';
import '../widgets/travel_card.dart';
import 'detail_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final Color maroon = const Color(0xFF800000); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200], 
      appBar: AppBar(
        title: const Text(
          "Travel Booking",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: maroon,
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 5, 
      ),
      body: SafeArea( 
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: ListView.builder(
            itemCount: travelList.length,
            itemBuilder: (context, index) {
              final travel = travelList[index];
              return Container(
                margin: const EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3))],
                ),
                child: TravelCard(
                  travel: travel,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DetailScreen(travel: travel)),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
