import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/blocs/auth_bloc/auth_events.dart';
import 'package:flutter_project/screens/login_screen.dart';
import '../blocs/auth_bloc/auth_bloc.dart';
import '../blocs/auth_bloc/auth_states.dart';
import '../constants.dart';
import '../cubits/auth_cubit/auth_cubit.dart';
import '../cubits/chat_cubit/chat_cubit.dart';
import '../widgets/button.dart';
import '../widgets/showSnack.dart';
import '../widgets/textField.dart';
import 'chat_screen.dart';

TextEditingController txt1 = TextEditingController();
TextEditingController txt2 = TextEditingController();

class Register extends StatelessWidget {
  const Register({super.key});

  static String id = 'register';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: BlocConsumer<AuthBloc, AuthStates>(
        listener: (context, state) {
          if (state is RegisterSuccess) {
            showSnackBar(context, 'email created successfully.');
            BlocProvider.of<ChatCubit>(context).getMessages();
            Navigator.of(context).pushReplacementNamed(Chat.id);
          } else if (state is RegisterFailure) {
            showSnackBar(context, state.error);
          }
        },
        builder: (context, state) => Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 110,
              ),
              const Image(image: AssetImage(Klogo), height: 100),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Scholar Chat',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontFamily: 'Pacifico'),
                  ),
                ],
              ),
              const SizedBox(height: 60),
              const Row(
                children: [
                  Text(
                    'Register',
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontFamily: 'Pacifico'),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              txtField(
                label: 'Email',
                txt: txt1,
                ob: false,
              ),
              const SizedBox(
                height: 10,
              ),
              txtField(
                label: 'Password',
                txt: txt2,
                ob: true,
              ),
              const SizedBox(height: 15),
              Button(
                isLoading: state is RegisterLoading ? true : false,
                label: 'Sign Up',
                on: () => BlocProvider.of<AuthBloc>(context).add(RegisterUserEvent(email: txt1.text, password: txt2.text)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("already have an account ?",
                      style: TextStyle(color: Colors.white)),
                  TextButton(
                      onPressed: () {
                        txt1.text = '';
                        txt2.text = '';
                        Navigator.of(context).pushReplacementNamed(Login.id);
                      },
                      child: Text(
                        'login',
                        style: TextStyle(color: Colors.lightBlue[200]),
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
