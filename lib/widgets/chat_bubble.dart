
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
  Widget build(BuildContext context) 
  {
      return Align
      (
        alignment: Alignment.centerLeft,
        child: Container
        (
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          decoration: const BoxDecoration
          (
            borderRadius: const BorderRadius.only
            (
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            color: kPColor,
          ),
          child: Column
          (
            crossAxisAlignment: CrossAxisAlignment.start, // لمحاذاة النصوص بشكل مرتب
            mainAxisSize: MainAxisSize.min, // يضمن عدم أخذ مساحة زائدة
            children: 
            [
              // 🆔 معرف المرسل بلون أصغر وأخف مثل تطبيقات المراسلة
              Text
              (
                message.id,
                style: const TextStyle
                (
                  color: Colors.white70,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 5), // تباعد بين المعرف والمحتوى
              
              // 💬 محتوى الرسالة بخط أكبر وواضح
              Text
              (
                message.messageContent,
                style: const TextStyle
                (
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      );
    }
}


class ChatBubble2 extends StatelessWidget 
{
  ChatBubble2({required this.message,
    super.key,
  });
  Message message;

  @override
  Widget build(BuildContext context) {
    return Align
    (
      alignment: Alignment.centerRight,
      child: Container
      (
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.symmetric(vertical: 15,horizontal: 15),
        decoration: const BoxDecoration
        (
          borderRadius: BorderRadius.only
          (
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          color: Color.fromARGB(255, 1, 126, 148),
        ),
        child: Column
        (
          crossAxisAlignment: CrossAxisAlignment.start, // لمحاذاة النصوص بشكل مرتب
          mainAxisSize: MainAxisSize.min,
          //alignment: Alignment.bottomLeft,
          children: 
          [
            Text
            (
              message.id,
              style: const TextStyle
              (
                color: Colors.white70,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 5),
            Text
            (
              message.messageContent,
              style: const TextStyle
              (
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ],
        ),
        
        // child: Column
        // (
        //   children: 
        //   [
        //     Text(message.id,style: TextStyle(color: Colors.white),),
        //     Text(message.messageContent,style: TextStyle(color: Colors.white),),
        //   ],
        // ),
      ),
    );
  }
}