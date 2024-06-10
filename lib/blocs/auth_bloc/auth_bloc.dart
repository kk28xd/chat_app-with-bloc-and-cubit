import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/blocs/auth_bloc/auth_events.dart';
import 'package:flutter_project/blocs/auth_bloc/auth_states.dart';

class AuthBloc extends Bloc<AuthEvents, AuthStates> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvents>((event, emit) async {
      if (event is LoginUserEvent) {
        if (event.email == '' || event.password == '') {
          emit(LoginFailure());
        } else {
          emit(LoginLoading());
          try {
            UserCredential userCredential = await FirebaseAuth.instance
                .signInWithEmailAndPassword(
                email: event.email, password: event.password);
            emit(LoginSuccess());
          } catch (e) {
            emit(LoginFailure());
          }
        }
      } else if (event is RegisterUserEvent) {
        if (event.email == '' || event.password == '') {
          emit(RegisterFailure(error: 'Incomplete data.'));
        } else {
          emit(RegisterLoading());
          try {
            UserCredential userCredential = await FirebaseAuth.instance
                .createUserWithEmailAndPassword(
                email: event.email, password: event.password);
            emit(RegisterSuccess());
          } on FirebaseAuthException catch (e) {
            emit(RegisterFailure(error: e.code));
          } catch (e) {
            emit(RegisterFailure(error: 'something went wrong'));
          }
        }
      }
    });
  }
}
