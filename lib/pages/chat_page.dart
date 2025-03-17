import 'package:chat_app/constants.dart';
import 'package:chat_app/models/message_model.dart';
import 'package:chat_app/widgets/chat_bubble.dart';
import 'package:chat_app/widgets/custom_text_faild.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget 
{
  ChatPage({super.key});
  String id="ChatPage";
  String ? value;
  TextEditingController controller=TextEditingController();
 // FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference messages = FirebaseFirestore.instance.collection(KMessagesCollection);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>
    (
      
      future: messages.get(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) 
      {
        
        if(snapshot.hasData)
        {
          List<Message> messagesList=[];
          for(int i=0;i<snapshot.data!.docs.length;i++)
          {
            messagesList.add(Message.fromJason(snapshot.data!.docs[i]));
          }
          //print(snapshot.data!.docs[0]["content"]);
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
                    itemCount: messagesList.length,
                    itemBuilder: (context, index) 
                    { 
                      return ChatBubble(message: messagesList[index],);
                    },
                    
                  ),
                ),
                Padding
                (
                  padding: const EdgeInsets.all(10),
                  child: CustomTextFaild
                  (
                    controller: controller,
                    onChange: (data)
                    {
                      value=data;
                      
                    },
                    hintText: "Enter message",
                    pColor: kPColor,
                    suffix: IconButton
                    (
                      onPressed: () 
                      {
                        messages.add
                        (
                          {"content":value}
                        );
                        controller.clear();
                      },
                      icon:Icon(Icons.send_sharp,color: kPColor),
                    ),
                  ),
                )
              ],
            ),
          );
        }
        else
        {
          return Text("Loading ....");
        }
      },
    );
  }
}
