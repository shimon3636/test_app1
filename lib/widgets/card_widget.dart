import 'package:flutter/material.dart';
import '../models/card.dart';

class CardWidget extends StatelessWidget {
  final PlayingCard card;

  CardWidget({required this.card});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(4.0),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            card.rank.toString(),
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 4),
          Text(
            card.suit,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
