import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/card_model.dart';
import '../services/deck_service.dart';
import '../widgets/card_display.dart';

class GamePage extends StatefulWidget {
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  final DeckService _deckService = DeckService();
  late CardModel _userCard;
  late CardModel _opponentCard;
  int _points = 100;
  int _correctPredictions = 0;
  List<bool?> _predictionResults = [null, null, null, null, null];
  int _currentRound = 0;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _userCard = _deckService.drawRandomCard();
    _loadPoints();
  }

  Future<void> _loadPoints() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _points = prefs.getInt('points') ?? 100;
      _isLoading = false;
    });
  }

  void _savePoints() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('points', _points);
  }

  void _makePrediction(bool isHigher) {
    setState(() {
      _opponentCard = _deckService.drawRandomCard();
      bool isCorrect = (isHigher && _opponentCard.value > _userCard.value) ||
          (!isHigher && _opponentCard.value < _userCard.value);

      _predictionResults[_currentRound] = isCorrect;
      if (isCorrect) {
        _correctPredictions++;
      }
      _currentRound++;

      if (_currentRound == 5) {
        _endGame();
      }
    });
  }

  void _endGame() {
    if (_correctPredictions >= 3) {
      _points += 10;
    } else {
      _points -= 10;
    }

    _savePoints();

    String result = _correctPredictions >= 3 ? "You Win! 🎉" : "You Lose! 💔";
    _showResultDialog(result);
  }

  void _showResultDialog(String result) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          backgroundColor: Colors.grey,
          title: Text(
            result,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.yellowAccent,
              fontFamily: 'Cursive',
            ),
          ),
          content: const Text(
            "Would you like to play again?",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontFamily: 'Neomuris',
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.greenAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 15.0),
                    ),
                    child: const Text(
                      "Yes",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                      _restartGame();
                    },
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.redAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 20.0),
                    ),
                    child: const Text(
                      "No",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  void _restartGame() {
    setState(() {
      _correctPredictions = 0;
      _currentRound = 0;
      _userCard = _deckService.drawRandomCard();
      _predictionResults = [null, null, null, null, null];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // Extend the body behind the app bar
      appBar: AppBar(
        leading: BackButton(),
        title: const Text(
          'CardBet Royale',
          style: TextStyle(
              fontFamily: 'Neomuris',
              color: Color(0xFFFFD700), // Gold color
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor:
            Colors.black.withOpacity(0.8), // Semi-transparent black
        elevation: 0, // Removes the shadow
      ),
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage('assets/images/newback1.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.3), // Lightens the background
                  BlendMode.darken,
                ),
              ),
            ),
          ),
          // Content on top of the background
          _isLoading
              ? Center(child: CircularProgressIndicator())
              : Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 80),
                      Text(
                        'Coins💰 $_points',
                        style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white60), // Gold color
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(5, (index) {
                          return Container(
                            width: 30,
                            height: 30,
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                              color: _predictionResults[index] == null
                                  ? Colors.blueGrey
                                  : _predictionResults[index]!
                                      ? Colors.lightGreen
                                      : Colors.redAccent,
                              borderRadius: BorderRadius.circular(15),
                            ),
                          );
                        }),
                      ),
                      const SizedBox(height: 10),
                      CardDisplay(card: _userCard),
                      const SizedBox(height: 5),
                      const Text(
                        'Will the opponent\'s card be higher or lower?',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Neomuris',
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFFFD700), // Gold color
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                            onPressed: _currentRound < 5
                                ? () => _makePrediction(true)
                                : null,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                            ),
                            child: const Text(
                              'Higher',
                              style: TextStyle(
                                  fontFamily: 'Neomuris',
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: _currentRound < 5
                                ? () => _makePrediction(false)
                                : null,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                            ),
                            child: const Text(
                              'Lower',
                              style: TextStyle(
                                  fontFamily: 'Neomuris',
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      if (_currentRound > 0) CardDisplay(card: _opponentCard),
                      // const SizedBox(height: 20),
                    ],
                  ),
                ),
        ],
      ),
    );
  }
}
