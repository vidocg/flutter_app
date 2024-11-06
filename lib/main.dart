import 'package:flutter/material.dart';
import 'package:flutter_app/routes/router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'screen/login/login_bloc.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider<LoginBloc>(
      create: (context) => LoginBloc(),
      lazy: false,
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        AppRouter.router.refresh();
      },
      child: MaterialApp.router(routerConfig: AppRouter.router),
    );
  }
}
