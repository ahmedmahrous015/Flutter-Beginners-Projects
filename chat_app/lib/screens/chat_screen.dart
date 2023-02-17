import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholar_chat/cubits/chat_cubit/chat_cubit.dart';
import 'package:scholar_chat/models/message.dart';
import 'package:scholar_chat/widgets/chat_bubble.dart';
import 'package:scholar_chat/widgets/constants.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({Key? key}) : super(key: key);
  static String id = 'ChatScreen';

  TextEditingController controller = TextEditingController();
  final _controller = ScrollController();
  List<Message> messagesList = [];

  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kPrimaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              kLogo,
              height: 50,
            ),
            Text('Chat'),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<ChatCubit, ChatState>(
              builder: (context, state) {
                var messagesList =
                    BlocProvider.of<ChatCubit>(context).messagesList;
                return BlocBuilder<ChatCubit, ChatState>(
                  builder: (context, state) {
                    return ListView.builder(
                      reverse: true,
                      controller: _controller,
                      itemCount: messagesList.length,
                      itemBuilder: ((context, index) {
                        return messagesList[index].id == email
                            ? chatBubble(
                                message: messagesList[index],
                              )
                            : chatBubbleForFreind(
                                message: messagesList[index],
                              );
                      }),
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: controller,
              onSubmitted: (data) {
                BlocProvider.of<ChatCubit>(context)
                    .sendMessage(email: email, message: data);

                controller.clear();
                _controller.animateTo(0,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.fastOutSlowIn,);
              },
              decoration: InputDecoration(
                hintText: 'Send Message',
                suffixIcon: Icon(
                  Icons.send,
                  color: kPrimaryColor,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    color: kPrimaryColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
