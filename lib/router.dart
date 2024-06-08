import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'page1.dart';
import 'page2.dart';

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
    // ここに「GoRouterの追加分」を後で追加
  ],
);