import 'package:flutter/material.dart';
import 'package:flutter_app/routes/router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'screen/login/login_bloc.dart';

void main() {
  runApp( MultiBlocProvider(
          providers: [
            BlocProvider<LoginBloc>(
              create: (context) =>
                 LoginBloc(), lazy: false,
            ),

          ],
          child: MyApp()
      ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: getRouter(),
    );
  }
}
