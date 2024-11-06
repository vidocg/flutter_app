import 'package:flutter/material.dart';
import 'package:flutter_app/screen/homepage.dart';
import 'package:flutter_app/screen/login/login_bloc.dart';
import 'package:flutter_app/screen/login/login_screen.dart';
import 'package:flutter_app/screen/logout/logout_screen.dart';
import 'package:flutter_app/util/dialog_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/widgets.dart';

abstract class AppRouter {
  static final List<String> _publicPages = ["/login", "/main", "/"];

  static GoRouter router = GoRouter(
      redirect: (context, state) {
        final status = context.read<LoginBloc>().state;

        final notAuthenticated = status is! LoginSuccess;
        debugPrint("App location: ${state.matchedLocation.toString()}");

        if (notAuthenticated) {
          debugPrint(status.toString());
          for (var value in _publicPages) {
            if (state.matchedLocation == value) {
              return null;
            }
          }
          return "/login";
        }
        return null;
      },
      routes: <RouteBase>[
        GoRoute(
          path: '/',
          builder: (BuildContext context, GoRouterState state) {
            return const HomePage(
              title: 'main',
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
}
