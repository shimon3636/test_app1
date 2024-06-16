import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'menu_battle_com.dart';

class PlayGame1 extends StatelessWidget {
  const PlayGame1({super.key});
  static const path = '/play_game1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('一人で遊ぶ'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () => GoRouter.of(context).push(BattleCom.path),
                child: const Text('COM対戦'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () => GoRouter.of(context).pop(),
                child: const Text('ランダム対戦'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () => GoRouter.of(context).pop(),
                child: const Text('レート対戦'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
