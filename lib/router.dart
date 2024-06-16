import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'screens/page1.dart';
import 'screens/menu_battle_com.dart';
import 'screens/page3.dart';
import 'screens/play_game1.dart';
import 'screens/play_game_all.dart';
import 'screens/game_screen.dart';

final router = GoRouter(
  initialLocation: MyHomePage.path,
  routes: [
    GoRoute(
      path: MyHomePage.path,
      pageBuilder: (BuildContext context, GoRouterState? state) =>
          const MaterialPage(
        child: MyHomePage(),
      ),
    ),
    GoRoute(
      path: BattleCom.path,
      pageBuilder: (BuildContext context, GoRouterState? state) =>
          const MaterialPage(
        child: BattleCom(),
      ),
    ),
    GoRoute(
      path: Page3.path,
      pageBuilder: (BuildContext context, GoRouterState? state) =>
          const MaterialPage(
        child: Page3(),
      ),
    ),
    GoRoute(
      path: PlayGame1.path,
      pageBuilder: (BuildContext context, GoRouterState? state) =>
          const MaterialPage(
        child: PlayGame1(),
      ),
    ),
    GoRoute(
      path: PlayGameAll.path,
      pageBuilder: (BuildContext context, GoRouterState? state) =>
          const MaterialPage(
        child: PlayGameAll(),
      ),
    ),
    GoRoute(
      path: GameScreen.path,
      builder: (context, state) {
        final number = int.parse(state.pathParameters['number']!);
        return GameScreen(
          playerCount: number,
        );
      },
    ),
    // ここに「GoRouterの追加分」を後で追加
  ],
);
