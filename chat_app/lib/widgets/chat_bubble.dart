import 'package:flutter/material.dart';
import 'package:scholar_chat/models/message.dart';
import 'constants.dart';

class chatBubble extends StatelessWidget {
  const chatBubble({
    Key? key,
    required this.message,
  }) : super(key: key);
  final Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
            bottomRight: Radius.circular(32),
          ),
        ),
        child: Text(
          message.message,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class chatBubbleForFreind extends StatelessWidget {
  const chatBubbleForFreind({
    Key? key,
    required this.message,
  }) : super(key: key);
  final Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: Color(0xff006D84),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
            bottomLeft: Radius.circular(32),
          ),
        ),
        child: Text(
          message.message,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
