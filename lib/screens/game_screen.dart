import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/card.dart';
import '../utils/decks.dart';
import '../widgets/card_widget.dart';

class GameScreen extends StatefulWidget {
  final int playerCount;
  static const path = '/play_game_com/:number';

  GameScreen({required this.playerCount});

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> with TickerProviderStateMixin {
  late List<PlayingCard> playerHand;
  late List<List<PlayingCard>> comHands;
  late List<PlayingCard> tableCards;
  late Deck deck;
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  @override
  void initState() {
    super.initState();
    startGame();
    dealCards();
  }

  void startGame() {
    deck = Deck();
    playerHand = [];
    comHands = List.generate(widget.playerCount - 1, (_) => []);
    tableCards = [
      PlayingCard(suit: 'hearts', rank: 7),
      PlayingCard(suit: 'diamonds', rank: 7),
      PlayingCard(suit: 'clubs', rank: 7),
      PlayingCard(suit: 'spades', rank: 7),
    ];
  }

  void dealCards() async {
    for (int i = 0; i < 5; i++) {
      await Future.delayed(Duration(milliseconds: 300), () {
        _listKey.currentState?.insertItem(playerHand.length,
            duration: Duration(milliseconds: 300));
        playerHand.add(deck.deal(1).first);
      });
    }
    // COMにカードを配る
    for (int i = 0; i < comHands.length; i++) {
      comHands[i] = deck.deal(5);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('7並べ - ゲーム画面'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Wrap(
                spacing: 10,
                runSpacing: 10,
                children:
                    tableCards.map((card) => CardWidget(card: card)).toList(),
              ),
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('あなたの手札'),
          ),
          Expanded(
            child: AnimatedList(
              key: _listKey,
              initialItemCount: playerHand.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index, animation) {
                return SlideTransition(
                  position: animation.drive(
                    Tween<Offset>(
                      begin: Offset(0, 1),
                      end: Offset(0, 0),
                    ).chain(CurveTween(curve: Curves.easeIn)),
                  ),
                  child: CardWidget(card: playerHand[index]),
                );
              },
            ),
          ),
          ElevatedButton(
              onPressed: () => context.go("/page1"), child: const Text('トップ画面'))
        ],
      ),
    );
  }
}
