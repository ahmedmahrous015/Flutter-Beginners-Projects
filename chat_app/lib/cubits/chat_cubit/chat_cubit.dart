import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:scholar_chat/models/message.dart';
import 'package:scholar_chat/widgets/constants.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());
  CollectionReference messages =
      FirebaseFirestore.instance.collection(KMessageCollection);
  List<Message> messagesList = [];
  void sendMessage({required String email, required String message}) {
    try {
      messages.add({
        kMessage: message,
        kCreatedAt: DateTime.now(),
        'id': email,
      });
    } on Exception catch (e) {
      // TODO
    }
  }

  void getMessages() {
   
    messages.orderBy(kCreatedAt, descending: true).snapshots().listen((event) {
       messagesList.clear();
      for (var doc in event.docs) {
        messagesList.add(Message.fromJson(doc));
      }
      emit(ChatSuccess(messages: messagesList));
    });
  }
}
