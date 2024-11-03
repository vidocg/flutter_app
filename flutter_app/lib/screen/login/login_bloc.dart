import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginButtonPressed>((event, emit) {
      emit(LoginLoading());
      try {
        // todo: call ext api
        Future.delayed(const Duration(seconds: 2));
        emit(LoginSuccess());
      } catch (error) {
        emit(LoginFailure(error: error.toString()));
      }
    });
  }

}
