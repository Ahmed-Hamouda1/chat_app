import 'package:chat_app/constants.dart';
import 'package:chat_app/pages/login_page.dart';
import 'package:chat_app/widgets/custom_button.dart';
import 'package:chat_app/widgets/custom_text_faild.dart';
import 'package:flutter/material.dart';


class RegisterPage extends StatelessWidget 
{
  RegisterPage({super.key});
  String id="RegisterPage";
  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
      backgroundColor:kPColor,
      body: Padding
      (
        padding: const EdgeInsets.all(10),
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
            const CustomTextFaild(hintText: "Email",),
            const CustomTextFaild(hintText: "password",),
            const CustomButton(title: "Register",),
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
    );
  }
}
