import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/cubits/chat_cubit/chat_states.dart';
import 'package:flutter_project/models/messageModel.dart';

class ChatCubit extends Cubit<ChatStates> {
  ChatCubit() : super(ChatInitial());
  CollectionReference messages =
  FirebaseFirestore.instance.collection('messages');
  List<messageModel> messList = [];
  void sendMessages ({required String message,required String email}){
    messages.add({
      'content': message,
      'time': DateTime.now(),
      'email': email
    });
  }
  void getMessages (){
    messages.orderBy('time', descending: true).snapshots().listen((event) {
      log('yes');
      messList = [];
      for (var doc in event.docs) {
        messList.add(messageModel.fromJson(doc));
      }
      emit(ChatSuccess(messList: messList));
      log('no');
    });
  }
}
