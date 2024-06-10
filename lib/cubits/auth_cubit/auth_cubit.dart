import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_states.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitial());

  Future<void> loginUser(
      {required String email, required String password}) async {
    if (email == '' || password == '') {
      emit(LoginFailure());
    }
    else{
      emit(LoginLoading());
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
        emit(LoginSuccess());
      } catch (e) {
        emit(LoginFailure());
      }
    }
  }

  Future<void> registerUser(
      {required String email, required String password}) async {
    if (email == '' || password == '') {
      emit(RegisterFailure(error: 'Incomplete data.'));
    }
    else{
      emit(RegisterLoading());
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        emit(RegisterSuccess());
      } on FirebaseAuthException catch (e) {
        emit(RegisterFailure(error: e.code));
      } catch (e) {
        emit(RegisterFailure(error: 'something went wrong'));
      }
    }

  }
}
