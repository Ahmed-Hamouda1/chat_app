import 'package:chat_app/constants.dart';
import 'package:chat_app/pages/chat_page.dart';
import 'package:chat_app/services/methods.dart';
import 'package:chat_app/widgets/custom_button.dart';
import 'package:chat_app/widgets/custom_text_faild.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginPage extends StatefulWidget 
{
  //عملناها استاتفول علشان صفحة اللودنج
  LoginPage({super.key});
  String id="LoginPage";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> 
{
  String? email,pass;
  bool isLoading=false;
  GlobalKey<FormState> formKey=GlobalKey();

  @override
  Widget build(BuildContext context) 
  {
    return ModalProgressHUD
    (
      inAsyncCall: isLoading,
      child: Scaffold
      (
        backgroundColor:kPColor,
        body: Padding
        (
          padding: const EdgeInsets.all(10),
          child: Form
          (
            key:formKey,
            child: Column
            (
              children: 
              [
                const Spacer(flex:2),
                Image.asset("assets/images/scholar.png"),
                const Text
                (
                  "Scholar Chat",
                  style: TextStyle
                  (
                      color: Colors.white, 
                      fontSize: 30, 
                      fontFamily:"Pacifico"
                  ),
                ),
                const Spacer(flex:2),
                //const SizedBox(height: 100,),
                const Row
                (
                  children: 
                  [
                    Text
                    (
                      "LOGIN",
                      textAlign: TextAlign.end,
                      style: TextStyle
                      (
                        color: Colors.white, 
                        fontSize: 20
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10,),
                CustomTextFaild
                (
                  hintText: "Email",
                  pColor: Colors.white,
                  onChange: (value)
                  {
                    email=value;
                  },
                ),
                CustomTextFaild
                (
                  hintText: "password",
                  pColor: Colors.white,
                  onChange: (value)
                  {
                    pass=value;
                  },
                ),
                CustomButton
                (
                  title: "LOGIN",
                  onTap: () async
                  {
                    if (formKey.currentState!.validate()) 
                    {
                      isLoading= true;
                      setState(() {
                        
                      });
                      try 
                      {
                        await loginAccount();
                        showSnackBar(context,'success');
                        Navigator.pushNamed(context, ChatPage().id);
                      }on FirebaseAuthException catch (e) 
                      { 
                        if (e.code == 'user-not-found') 
                        {
                          showSnackBar( context, 'No user found for that email.');
                        } 
                        else if (e.code == 'wrong-password') 
                        {
                          showSnackBar( context, 'Wrong password provided for that user.');
                        }
                      }
                      catch (e) 
                      {
                        showSnackBar(context,e.toString());
                      }
                      isLoading= false;
                      setState(() {
                      });
                    }
                    else
                    {}
                  },
                ),
                Padding
                (
                  padding: const EdgeInsets.all(10),
                  child: Row
                  (mainAxisAlignment: MainAxisAlignment.center,
                    children: 
                    [
                      const Text("don't have an account ? ",style: TextStyle(color: Colors.white),),
                      GestureDetector
                      (
                        onTap: ()
                        {
                          Navigator.pop(context);//pushNamed(context, "RegisterPage");
                        }, 
                        child: const Text
                        (
                          "  Register",
                          style: TextStyle
                          (
                            color: Color(0xffC7EDE6),
                            fontWeight: FontWeight.bold
                          ),
                        )
                      ),
                    ],
                  ),
                ),
                const Spacer(flex:2),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> loginAccount() async {
    var auth =FirebaseAuth.instance;
    var userCredential= await auth.signInWithEmailAndPassword(email: email!, password: pass!);
  }
}
