import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'page1.dart';
import 'page2.dart';
import 'page3.dart';
import 'play_game1.dart';
import 'play_game_all.dart';

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
      path: Page2.path,
      pageBuilder: (BuildContext context, GoRouterState? state) =>
          const MaterialPage(
        child: Page2(),
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
    // ここに「GoRouterの追加分」を後で追加
  ],
);
