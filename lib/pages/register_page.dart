import 'package:chat_app/constants.dart';
import 'package:chat_app/pages/login_page.dart';
import 'package:chat_app/services/methods.dart';
import 'package:chat_app/widgets/custom_button.dart';
import 'package:chat_app/widgets/custom_text_faild.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';


class RegisterPage extends StatefulWidget 
{
  RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String id="RegisterPage";
  String? email,pass;
  bool isLoading= false;
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) 
  {
    return ModalProgressHUD
    (
      color: Colors.black,
      inAsyncCall: isLoading,
      child: Scaffold
      (
        backgroundColor:kPColor,
        body: Padding
        (
          padding: const EdgeInsets.all(10),
          child: Form
          (
            key: formKey,
            child: Column
            (
              
              //mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: 
              [
                const Spacer(flex:2),
                Image.asset("assets/images/scholar.png"),
                const Text
                (
                  "Scholar Chat",
                  style: TextStyle(
                      color: Colors.white, fontSize: 30, fontFamily:"Pacifico"),
                ),
                const Spacer(flex:2),
                //const SizedBox(height: 100,),
                const Row
                (
                  children: [
                    Text
                    (
                      "Register",
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          color: Colors.white, fontSize: 20),
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
                  secure: true,
                  onChange: (value)
                  {
                    pass=value;
                  },
                ),
                CustomButton
                (
                  title: "Register",
                  onTap: () async
                  {
                    if (formKey.currentState!.validate()) 
                    {
                      isLoading= true;
                      setState(() {
                        
                      });
                      try 
                      {
                        await createAccount();
                        showSnackBar(context,'success');
                      }on FirebaseAuthException catch (e) 
                      { 
                        if (e.code == 'weak-password') 
                        {
                                
                          showSnackBar(context,'The password provided is too weak.');
                        } else if (e.code == 'email-already-in-use') 
                        {
                          showSnackBar(context,'The account already exists for that email.');
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
                    {
      
                    }
                  },
                ),
                Padding
                (
                  padding: const EdgeInsets.all(10),
                  child: Row
                  (mainAxisAlignment: MainAxisAlignment.center,
                    children: 
                    [
                      const Text("already have an account ? ",style: TextStyle(color: Colors.white),),
                      GestureDetector
                      (
                        onTap: ()
                        {
                          Navigator.pushNamed(context, LoginPage().id);
                        }, 
                        child: const Text
                        (
                          "  Login",
                          style: TextStyle
                          (
                            color: Color(0xffC7EDE6),
                            fontWeight: FontWeight.bold
                          ),
                        ),
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

  Future<void> createAccount() async {
    var auth =FirebaseAuth.instance;
    var userCredential= await auth.createUserWithEmailAndPassword(email: email!, password: pass!);
  }
}
