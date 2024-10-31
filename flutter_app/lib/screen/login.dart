import 'package:flutter/material.dart';
import 'package:flutter_app/http/auth/auth_api_client.dart';
import 'package:flutter_app/http/auth/auth_api_model.dart';
import 'package:flutter_app/screen/appbar.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final AuthApiClient authApiClient = AuthApiClient();

  static const String title = 'Login';
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, title),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              obscureText: true,
              controller: passController,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                authApiClient.login(
                    AuthApiRequest(passController.text, emailController.text));
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
