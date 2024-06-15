import '../models/card.dart';

class Deck {
  List<PlayingCard> cards = [];

  Deck() {
    List<String> suits = ['hearts', 'diamonds', 'clubs', 'spades'];
    for (String suit in suits) {
      for (int rank = 1; rank <= 13; rank++) {
        cards.add(PlayingCard(suit: suit, rank: rank));
      }
    }
    cards.shuffle();
  }

  List<PlayingCard> deal(int count) {
    return cards.take(count).toList();
  }
}
