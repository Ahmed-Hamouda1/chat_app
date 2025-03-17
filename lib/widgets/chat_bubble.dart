
import 'package:chat_app/constants.dart';
import 'package:chat_app/models/message_model.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget 
{
  ChatBubble({required this.message,
    super.key,
  });
  Message message;

  @override
  Widget build(BuildContext context) {
    return Align
    (
      alignment: Alignment.centerLeft,
      child: Container
      (
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.symmetric(vertical: 30,horizontal: 15),
        decoration: const BoxDecoration
        (
          borderRadius: BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25),bottomRight: Radius.circular(25)),
          color: kPColor
        ),
        
        
        child: Text(message.messageContent,style: TextStyle(color: Colors.white),),
      ),
    );
  }
}