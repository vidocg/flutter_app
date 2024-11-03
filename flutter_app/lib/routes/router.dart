import 'package:flutter/material.dart';
import 'package:flutter_app/screen/homepage.dart';
import 'package:flutter_app/screen/login/login_screen.dart';
import 'package:flutter_app/screen/logout/logout_screen.dart';
import 'package:flutter_app/util/dialog_page.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/widgets.dart';

final GoRouter _router = GoRouter(routes: <RouteBase>[
  GoRoute(
    path: '/',
    builder: (BuildContext context, GoRouterState state) {
      return const MyHomePage(
        title: 'test',
      );
    },
    routes: <RouteBase>[
      GoRoute(
        path: 'login',
        builder: (BuildContext context, GoRouterState state) {
          return const LoginScreen();
        },
      ),
      GoRoute(
        path: 'logout',
        pageBuilder: (context, state) =>
            DialogPage(builder: (_) => LogoutScreen()),
      ),
    ],
  ),
]);

GoRouter getRouter() => _router;
