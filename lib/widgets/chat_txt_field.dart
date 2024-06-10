
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../constants.dart';
import '../cubits/chat_cubit/chat_cubit.dart';
import '../screens/register_screen.dart';
class Chat_Txt_Field extends StatelessWidget {
  const Chat_Txt_Field({super.key, required this.txtm, required this.controller});
  final TextEditingController txtm;
  final ScrollController controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: (value) {
        if (txtm.text.isNotEmpty) {
          BlocProvider.of<ChatCubit>(context).sendMessages(
              message: txtm.text, email:txt1.text);
          BlocProvider.of<ChatCubit>(context).getMessages();
          txtm.text = '';
          controller.animateTo(0,
              duration: const Duration(seconds: 1),
              curve: Curves.fastOutSlowIn);
        }
      },
      controller: txtm,
      decoration: InputDecoration(
          hintText: 'Message',
          suffixIcon: IconButton(
              icon: const Icon(Icons.send),
              color: kPrimaryColor,
              onPressed: () {
                if (txtm.text.isNotEmpty) {
                  BlocProvider.of<ChatCubit>(context).sendMessages(
                      message: txtm.text, email:txt1.text);
                  BlocProvider.of<ChatCubit>(context).getMessages();
                  txtm.text = '';
                  controller.animateTo(0,
                      duration: const Duration(seconds: 1),
                      curve: Curves.fastOutSlowIn);
                }
              }),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: kPrimaryColor, width: 2)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: kPrimaryColor, width: 2)),
          isDense: true,
          contentPadding: const EdgeInsets.all(12)),
    );
  }
}
