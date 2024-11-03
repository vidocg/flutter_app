import 'package:flutter_app/screen/homepage.dart';
import 'package:flutter_app/screen/login/login_screen.dart';
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
          return  LoginScreen();
        },
      ),
    ],
  ),
]);

GoRouter getRouter() => _router;
