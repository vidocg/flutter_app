import 'package:flutter/material.dart';
import 'package:flutter_app/screen/login/login_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LogoutScreen extends StatelessWidget {
  const LogoutScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final loginBloc = BlocProvider.of<LoginBloc>(context);

    return AlertDialog(
      title: Text("Log out"),
      content: Text("Are you sure?"),
      actions: [
        ElevatedButton(
            onPressed: () {
              loginBloc.add(LogoutButtonPressed());
              context.go('/');
            },
            child: const Text("Log out")),
      ],
    );
  }
}
