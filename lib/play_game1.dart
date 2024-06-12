import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PlayGame1 extends StatefulWidget {
  const PlayGame1({super.key});
  static const path = '/play_game1';
  @override
  State<PlayGame1> createState() => _PlayGame1();
}

class _PlayGame1 extends State<PlayGame1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('一人で遊ぶ'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () => GoRouter.of(context).pop(),
              child: const Text('COM対戦'),
            ),
            ElevatedButton(
              onPressed: () => GoRouter.of(context).pop(),
              child: const Text('ランダム対戦'),
            ),
            ElevatedButton(
              onPressed: () => GoRouter.of(context).pop(),
              child: const Text('レート対戦'),
            ),
          ],
        ),
      ),
    );
  }
}
