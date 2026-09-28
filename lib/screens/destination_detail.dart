import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/destinationModels.dart';
import 'package:google_fonts/google_fonts.dart';

class DestinationDetailPage extends StatefulWidget {

  final DestinationModel destination;

  const DestinationDetailPage({
    super.key,
    required this.destination,
  });

  @override
  State<DestinationDetailPage> createState() =>
      _DestinationDetailPageState();
}

class _DestinationDetailPageState extends State<DestinationDetailPage> {

  void openWikipedia() {
    final url = Uri.parse(
      widget.destination.wikipediaUrl,
    );

    launchUrl(url);
  }

  void toggleLike() {

    setState(() {
      widget.destination.isLiked =
          !widget.destination.isLiked;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(163, 249, 155, 174),
        foregroundColor: Colors.white,
        title: Text(widget.destination.name),
        
        actions: [

          IconButton(
            onPressed: toggleLike,

            icon: Icon(
              widget.destination.isLiked
                  ? Icons.favorite
                  : Icons.favorite_border,

              color: widget.destination.isLiked
                  ? Colors.red
                  : Colors.grey,
            ),
          ),
        ],
      ),
      

      body: SingleChildScrollView(

        padding: const EdgeInsets.all(16),

        child: Column(

          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [

            Image.network(
              widget.destination.imageUrl,
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
            ),

            const SizedBox(height: 20),

            Text(
              widget.destination.name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              "Category: ${widget.destination.category}",
            ),

            Text(
              "Location: ${widget.destination.location}",
            ),

            const SizedBox(height: 20),

            const Text(
              "Description",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              "Opening Hours: ${widget.destination.openingHours}",
            ),

            const SizedBox(height: 20),

            Text(
              "Ticket Info: ${widget.destination.ticketInfo}",
            ),

            const SizedBox(height: 20),

            Text(
              "Attraction: ${widget.destination.attraction}",
            ),

            const SizedBox(height: 20),

            Text(
              widget.destination.description,
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: openWikipedia,
              child: const Text(
                "Open Wikipedia",
              ),
            ),

            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                "Kembali",
              ),
            ),
          ],
        ),
      ),
    );
  }
}