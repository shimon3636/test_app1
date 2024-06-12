import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PlayGameAll extends StatefulWidget {
  const PlayGameAll({super.key});
  static const path = '/play_game_all';
  @override
  State<PlayGameAll> createState() => _PlayGameAll();
}

class _PlayGameAll extends State<PlayGameAll> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('みんなで遊ぶ'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () => GoRouter.of(context).pop(),
              child: const Text('ゲーム部屋を作る'),
            ),
            ElevatedButton(
              onPressed: () => GoRouter.of(context).pop(),
              child: const Text('部屋に参加する'),
            ),
          ],
        ),
      ),
    );
  }
}
