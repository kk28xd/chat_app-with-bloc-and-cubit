import '../../models/messageModel.dart';

abstract class ChatStates {}

class ChatInitial extends ChatStates {}

class ChatSuccess extends ChatStates {
  List<messageModel> messList ;
  ChatSuccess({required this.messList});
}
