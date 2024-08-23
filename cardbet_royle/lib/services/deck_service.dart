import 'dart:math';
import '../models/card_model.dart';

class DeckService {
  final Random _random = Random();

  CardModel drawRandomCard() {
    return deck[_random.nextInt(deck.length)];
  }
}
