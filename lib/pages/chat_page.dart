import 'package:chat_app/constants.dart';
import 'package:chat_app/widgets/chat_bubble.dart';
import 'package:chat_app/widgets/custom_text_faild.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget 
{
  ChatPage({super.key});
  String id="ChatPage";

  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
      appBar: AppBar
      (
        automaticallyImplyLeading: false,
        backgroundColor: kPColor,
        //centerTitle: true,
        title: Row
        (
          mainAxisAlignment: MainAxisAlignment.center,
          children: 
          [
            Image.asset(kLogo,height: 60,),
            Text("Chat",style: TextStyle(color: Colors.white),)
          ],
        ),
      ),
      body: Column
      (
        children: 
        [
          Expanded
          (
            child: ListView.builder
            (
              itemBuilder: (context, index) 
              { 
                return ChatBubble();
              },
              
            ),
          ),
          Padding
          (
            padding: const EdgeInsets.all(10),
            child: CustomTextFaild
            (
              hintText: "Enter message",
              pColor: kPColor,
              suffix: IconButton
              (
                onPressed: () {  },
                icon:Icon(Icons.send_sharp,color: kPColor),
              ),
            ),
          )
        ],
      ),
    );
  }
}
