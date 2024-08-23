class CardModel {
  final String suit;
  final String rank;
  final int value;

  CardModel({required this.suit, required this.rank, required this.value});
}

final List<CardModel> deck = [
  // Clubs
  CardModel(suit: 'Clubs', rank: '2', value: 2),
  CardModel(suit: 'Clubs', rank: '3', value: 3),
  CardModel(suit: 'Clubs', rank: '4', value: 4),
  CardModel(suit: 'Clubs', rank: '5', value: 5),
  CardModel(suit: 'Clubs', rank: '6', value: 6),
  CardModel(suit: 'Clubs', rank: '7', value: 7),
  CardModel(suit: 'Clubs', rank: '8', value: 8),
  CardModel(suit: 'Clubs', rank: '9', value: 9),
  CardModel(suit: 'Clubs', rank: '10', value: 10),
  CardModel(suit: 'Clubs', rank: 'Jack', value: 11),
  CardModel(suit: 'Clubs', rank: 'Queen', value: 12),
  CardModel(suit: 'Clubs', rank: 'King', value: 13),
  CardModel(suit: 'Clubs', rank: 'Ace', value: 14),

  // Diamonds
  CardModel(suit: 'Diamonds', rank: '2', value: 2),
  CardModel(suit: 'Diamonds', rank: '3', value: 3),
  CardModel(suit: 'Diamonds', rank: '4', value: 4),
  CardModel(suit: 'Diamonds', rank: '5', value: 5),
  CardModel(suit: 'Diamonds', rank: '6', value: 6),
  CardModel(suit: 'Diamonds', rank: '7', value: 7),
  CardModel(suit: 'Diamonds', rank: '8', value: 8),
  CardModel(suit: 'Diamonds', rank: '9', value: 9),
  CardModel(suit: 'Diamonds', rank: '10', value: 10),
  CardModel(suit: 'Diamonds', rank: 'Jack', value: 11),
  CardModel(suit: 'Diamonds', rank: 'Queen', value: 12),
  CardModel(suit: 'Diamonds', rank: 'King', value: 13),
  CardModel(suit: 'Diamonds', rank: 'Ace', value: 14),
  // Add all other cards...

  // Hearts
  CardModel(suit: 'Hearts', rank: '2', value: 2),
  CardModel(suit: 'Hearts', rank: '3', value: 3),
  CardModel(suit: 'Hearts', rank: '4', value: 4),
  CardModel(suit: 'Hearts', rank: '5', value: 5),
  CardModel(suit: 'Hearts', rank: '6', value: 6),
  CardModel(suit: 'Hearts', rank: '7', value: 7),
  CardModel(suit: 'Hearts', rank: '8', value: 8),
  CardModel(suit: 'Hearts', rank: '9', value: 9),
  CardModel(suit: 'Hearts', rank: '10', value: 10),
  CardModel(suit: 'Hearts', rank: 'Jack', value: 11),
  CardModel(suit: 'Hearts', rank: 'Queen', value: 12),
  CardModel(suit: 'Hearts', rank: 'King', value: 13),
  CardModel(suit: 'Hearts', rank: 'Ace', value: 14),
  // Spades
  CardModel(suit: 'Spades', rank: '2', value: 2),
  CardModel(suit: 'Spades', rank: '3', value: 3),
  CardModel(suit: 'Spades', rank: '4', value: 4),
  CardModel(suit: 'Spades', rank: '5', value: 5),
  CardModel(suit: 'Spades', rank: '6', value: 6),
  CardModel(suit: 'Spades', rank: '7', value: 7),
  CardModel(suit: 'Spades', rank: '8', value: 8),
  CardModel(suit: 'Spades', rank: '9', value: 9),
  CardModel(suit: 'Spades', rank: '10', value: 10),
  CardModel(suit: 'Spades', rank: 'Jack', value: 11),
  CardModel(suit: 'Spades', rank: 'Queen', value: 12),
  CardModel(suit: 'Spades', rank: 'King', value: 13),
  CardModel(suit: 'Spades', rank: 'Ace', value: 14),
];
