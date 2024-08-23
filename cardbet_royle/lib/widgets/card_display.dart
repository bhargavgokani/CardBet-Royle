import 'package:flutter/material.dart';
import '../models/card_model.dart';

class CardDisplay extends StatelessWidget {
  final CardModel card;

  const CardDisplay({required this.card});

  @override
  Widget build(BuildContext context) {
    // Build the image path based on card rank and suit
    String imagePath = 'assets/images/${card.rank}of${card.suit}.png';

    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.blueGrey),
      ),
      child: Image.asset(
        imagePath,
        width: 100, // Adjust the size as needed
        height: 150, // Adjust the size as needed
        fit: BoxFit.cover,
      ),
    );
  }
}
