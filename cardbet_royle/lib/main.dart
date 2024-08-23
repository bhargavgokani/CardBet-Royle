import 'package:cardbet_royle/screens/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(CardBetRoyaleApp());
}

class CardBetRoyaleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CardBet Royale',
      theme: ThemeData(
          textTheme: TextTheme(
            bodyLarge: TextStyle(fontFamily: 'Neomuris'),
          ),
          primarySwatch: Colors.blue),
      home: HomePage(),
    );
  }
}
