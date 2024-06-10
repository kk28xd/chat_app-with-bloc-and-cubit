import 'package:flutter/material.dart';

class messageModel {
  final String Message;
  final String email;
  messageModel({required this.email, required this.Message});
  factory messageModel.fromJson (JsonData) {
    return messageModel(Message: JsonData['content'],email: JsonData['email']);
  }
}
