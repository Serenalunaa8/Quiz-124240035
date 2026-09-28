import 'package:flutter/material.dart';
import '../models/destinationModels.dart';
import 'destination_detail.dart';
import 'package:google_fonts/google_fonts.dart';
import 'login.dart';

class DestinationListPage extends StatelessWidget {
  const DestinationListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(163, 249, 155, 174),
        centerTitle: true,
        title: Text(
          "Travel Destination",
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                ),
              );
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),

      body: ListView.builder(
        itemCount: destinationList.length,

        itemBuilder: (context, index) {

          final destination = destinationList[index];

          return GestureDetector(
            onTap: () {

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      DestinationDetailPage(destination: destination),
                ),
              );

            },

            child: Card(
              child: ListTile(

                leading: Image.network(
                  destination.imageUrl,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),

                title: Text(
                  destination.name,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                  ),
                ),

                subtitle: Text(
                  "${destination.category} - ${destination.location}",
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}