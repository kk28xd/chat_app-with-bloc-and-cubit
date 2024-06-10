import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/cubits/chat_cubit/chat_cubit.dart';
import 'package:flutter_project/cubits/chat_cubit/chat_states.dart';
import 'package:flutter_project/screens/register_screen.dart';
import 'package:flutter_project/widgets/chat_txt_field.dart';

import '../constants.dart';
import '../models/messageModel.dart';
import '../widgets/message.dart';

class Chat extends StatelessWidget {
  static String id = 'chat';

  const Chat({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = ScrollController();
    TextEditingController txtm = TextEditingController();
    return BlocBuilder<ChatCubit, ChatStates>(builder: (context, state) {
      List list = BlocProvider.of<ChatCubit>(context).messList;
      return Scaffold(
        appBar: AppBar(
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage(Klogo),
                height: 50,
                width: 50,
              ),
              Text('Chat', style: TextStyle(color: Colors.white)),
            ],
          ),
          backgroundColor: kPrimaryColor,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Expanded(
                  child: ListView.builder(
                reverse: true,
                controller: controller,
                itemBuilder: (context, index) => list[index].email == txt1.text
                    ? Align(
                        alignment: Alignment.centerRight,
                        child: messageFromMe(
                          name: list[index].email,
                          m: list[index].Message,
                        ))
                    : message(m: list[index].Message,name: list[index].email),
                itemCount: list.length,
              )),
              Padding(
                padding: const EdgeInsets.only(top: 3),
                child: Chat_Txt_Field(txtm: txtm, controller: controller),
              ),
            ],
          ),
        ),
      );
    });
  }
}
