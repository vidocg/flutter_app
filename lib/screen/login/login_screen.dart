import 'package:flutter/material.dart';
import 'package:flutter_app/screen/appbar.dart';
import 'package:flutter_app/screen/login/login_bloc.dart';
import 'package:flutter_app/validators/validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  static const String title = 'Login';
  @override
  void dispose() {
    _emailController.dispose();
    _passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loginBloc = BlocProvider.of<LoginBloc>(context);
    return Scaffold(
        appBar: getAppBar(context, title),
        body: BlocListener<LoginBloc, LoginState>(listener:
            (loginContext, state) {
          if (state is LoginFailure) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(
                content: Text(state.error),
                duration: const Duration(seconds: 3),
              ));
          }
        }, child:
            BlocBuilder<LoginBloc, LoginState>(builder: (loginContext, state) {
          return Form(
              key: _formKey,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: _emailController,
                      validator: (value) => Validator.email(value),
                      decoration: const InputDecoration(
                          labelText: 'Email', hintText: "Enter your email"),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      obscureText: true,
                      controller: _passController,
                      validator: (value) => Validator.password(value),
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        hintText: "Enter your password",
                      ),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: state is! LoginLoading
                          ? () {
                              if (_formKey.currentState!.validate()) {
                                loginBloc.add(
                                  LoginButtonPressed(
                                    email: _emailController.text,
                                    password: _passController.text,
                                  ),
                                );
                                loginContext.go('/');
                              }
                            }
                          : null,
                      child: state is LoginLoading
                          ? const Text("loading")
                          : const Text("Login"),
                    ),
                  ],
                ),
              ));
        })));
  }
}
