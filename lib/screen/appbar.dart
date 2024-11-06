import 'package:flutter/material.dart';
import 'package:flutter_app/actions/actions.dart';
import 'package:flutter_app/screen/login/login_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

PreferredSizeWidget? getAppBar(BuildContext context, String title) {
  return PreferredSize(
      preferredSize: Size.fromHeight(56),
      child: BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
        return AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text(title),
            actions: getActions(context, state));
      }));
}
