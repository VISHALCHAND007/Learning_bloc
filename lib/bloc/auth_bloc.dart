import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthSignIn>(_authSignIn);
    on<AuthGoogleSignIn>(_authGoogleSignIn);
    on<AuthFacebookSignIn>(_authFacebookSignIn);
    on<AuthSignOut>(_authSignOut);
  }

  void _authSignIn(AuthEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final email = (event as AuthSignIn).email;
      final password = event.password;

      if (email.isEmpty || !email.contains('@')) {
        return emit(AuthFailure('Invalid Email'));
      }
      if (password.length < 6) {
        return emit(AuthFailure('Password can not be less than 6 characters.'));
      }

      //mimic an API call and then return success
      await Future.delayed(Duration(seconds: 2), () {
        return emit(AuthSuccess('$email-$password'));
      });
    } catch (error) {
      emit(AuthFailure((state as AuthFailure).error));
    }
  }

  void _authGoogleSignIn(AuthEvent event, Emitter<AuthState> emit) {
    emit(AuthFailure('Un-Implemented.'));
  }

  void _authFacebookSignIn(AuthEvent event, Emitter<AuthState> emit) {
    emit(AuthFailure('Un-Implemented.'));
  }
  void _authSignOut(AuthEvent event, Emitter<AuthState> emit) {
    emit(AuthInitial());
  }
}
