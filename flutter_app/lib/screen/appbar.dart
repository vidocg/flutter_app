import 'package:flutter/material.dart';
import 'package:flutter_app/actions/actions.dart';

AppBar getAppBar(BuildContext context, String title) {
  return AppBar(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: Text(title),
      actions: getActions(context));
}
