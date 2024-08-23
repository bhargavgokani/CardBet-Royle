import 'package:flutter/material.dart';
import 'game_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // Extend the body behind the app bar
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'CardBet Royale',
          style: TextStyle(
              color: Color(0xFFFFD700), // Gold color
              fontWeight: FontWeight.bold,
              // backgroundColor: Colors.black,
              fontFamily: 'Neomuris'),
        ),
        backgroundColor:
            Colors.black.withOpacity(0.7), // Semi-transparent black
        elevation: 0, // Removes the shadow
      ),
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage(
                    'assets/images/newback1.jpg'), // Ensure this matches your file structure
                fit: BoxFit.cover, // Ensure the image covers the whole screen
                colorFilter: ColorFilter.mode(
                  Colors.white.withOpacity(0.0), // Lightens the background
                  BlendMode.lighten,
                ),
              ),
            ),
          ),
          // Content of the page
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Color(0xFF8B0000), // Dark red
                padding: const EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 20), // Increased padding for a larger button
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      12), // Increased border radius for a smoother edge
                ),
              ),
              child: const Text('Start Game',
                  style: TextStyle(
                    color: Colors.white, // Gold color
                    fontSize: 20,
                    fontFamily: 'Neomuris',
                    fontWeight: FontWeight.bold,
                  )),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GamePage()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
