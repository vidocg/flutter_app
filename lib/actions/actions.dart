import 'package:flutter/material.dart';
import 'package:flutter_app/screen/login/login_bloc.dart';
import 'package:go_router/go_router.dart';

List<Widget> getActions(BuildContext context, LoginState state) => [
      const ActionWidget(
        iconData: Icons.shop,
        tooltip: 'main',
        path: '/',
      ),
      if (state is LoginSuccess)
        const ActionWidget(
            iconData: Icons.safety_check, path: '/logout', tooltip: 'logout')
      else
        const ActionWidget(
            iconData: Icons.safety_check, path: '/login', tooltip: 'login'),
    ];

class ActionWidget extends StatelessWidget {
  final IconData iconData;
  final String path;
  final String tooltip;
  const ActionWidget(
      {super.key,
      required this.iconData,
      required this.path,
      required this.tooltip});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: IconButton(
                icon: Icon(
                  iconData,
                ),
                tooltip: tooltip,
                onPressed: () => context.go(path),
              ),
            )
          ],
        )
      ],
    );
  }
}
