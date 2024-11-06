import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_app/http/auth/auth_api_client.dart';
import 'package:flutter_app/http/auth/auth_api_model.dart';
import 'package:flutter_app/storage/secure_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  AuthApiClient authApiClient = AuthApiClient();
  SecureStorage secureStorage = SecureStorage();

  LoginBloc() : super(LoginInitial()) {
    on<LoginButtonPressed>((event, emit) async {
      emit(LoginLoading());
      try {
        await authApiClient.login(AuthApiRequest(event.password, event.email));
        emit(LoginSuccess());
      } catch (error) {
        debugPrint(error.toString());
        emit(LoginFailure(error: error.toString()));
      }
    });

    on<LogoutButtonPressed>((event, emit) async {
      secureStorage.clean();
      emit(LoginInitial());
    });
  }
}
