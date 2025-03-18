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
  final ScrollController _scrollController = ScrollController();
 // FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference messages = FirebaseFirestore.instance.collection(KMessagesCollection);

  void scrollToBottom() 
  {
    Future.delayed(Duration(milliseconds: 300), () 
    {
      _scrollController.animateTo
      (
        0,
        duration: Duration(milliseconds: 1000),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) 
  {
    String email=ModalRoute.of(context)!.settings.arguments as String;
    return StreamBuilder<QuerySnapshot>
    (
      
      stream: messages.orderBy('createdAt',descending: true).snapshots(),
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
          WidgetsBinding.instance.addPostFrameCallback((_) => scrollToBottom());
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
                    reverse: true,
                    controller: _scrollController,
                    itemCount: messagesList.length,
                    itemBuilder: (context, index) 
                    { 
                      return messagesList[index].id==email?
                      ChatBubble(message: messagesList[index],):ChatBubble2(message: messagesList[index]);
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
                          {
                            "content":value,
                            "createdAt":DateTime.now(),
                            "id":email
                          }
                        ).then((_)
                        {
                          scrollToBottom();
                        });
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
