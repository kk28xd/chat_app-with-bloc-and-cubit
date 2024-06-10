import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/blocs/auth_bloc/auth_events.dart';
import 'package:flutter_project/cubits/auth_cubit/auth_cubit.dart';
import 'package:flutter_project/screens/register_screen.dart';
import 'package:flutter_project/widgets/textField.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../blocs/auth_bloc/auth_bloc.dart';
import '../blocs/auth_bloc/auth_states.dart';
import '../constants.dart';
import '../cubits/chat_cubit/chat_cubit.dart';
import '../widgets/button.dart';
import '../widgets/showSnack.dart';
import 'chat_screen.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  static String id = 'login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: BlocConsumer<AuthBloc, AuthStates>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            showSnackBar(context, 'welcome.');
            BlocProvider.of<ChatCubit>(context).getMessages();
            Navigator.of(context).pushReplacementNamed(Chat.id);
          } else if (state is LoginFailure) {
            if (txt1.text.isEmpty || txt2.text.isEmpty) {
              showSnackBar(context, 'Incomplete data.');
            } else {
              showSnackBar(context, 'user not found');
            }
          }
        },
        builder:(context, state) => Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              const SizedBox(
                height: 110,
              ),
              const Image(
                image: AssetImage(Klogo),
                height: 100,
              ),
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
                    'Login',
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontFamily: 'Pacifico'),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              txtField(label: 'Email', txt: txt1, ob: false),
              const SizedBox(
                height: 10,
              ),
              txtField(label: 'Password', txt: txt2, ob: true),
              const SizedBox(height: 15),
              Button(
                isLoading: state is LoginLoading ? true : false,
                label: 'Sign In',
                on: () => BlocProvider.of<AuthBloc>(context).add(LoginUserEvent(email: txt1.text, password: txt2.text)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("don't have an account ?",
                      style: TextStyle(color: Colors.white)),
                  TextButton(
                      onPressed: () {
                        txt1.text = '';
                        txt2.text = '';
                        Navigator.of(context)
                            .pushReplacementNamed(Register.id);
                      },
                      child: Text(
                        'Sign Up',
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
