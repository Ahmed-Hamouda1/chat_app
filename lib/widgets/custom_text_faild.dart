
import 'package:flutter/material.dart';

class CustomTextFaild extends StatelessWidget 
{
  final String hintText;
  Color pColor=Colors.white;
  Widget? suffix;
  bool secure ;
  TextEditingController? controller=TextEditingController();

  CustomTextFaild
  (
    {
      super.key, required this.hintText, this.onChange ,this.onSubmited, this.controller,required this.pColor,this.suffix,this.secure=false
    }
  );
  Function(String)? onChange;
  Function(String)? onSubmited;

  @override
  Widget build(BuildContext context) 
  {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField
      (
        obscureText: secure,
        controller: controller,
        //keyboardType: TextInputType.,
        validator: (data)
        {
          if(data!.isEmpty)
            return "is empty";
        },
        style: TextStyle(color: pColor),
        onChanged: onChange,
        onFieldSubmitted: onSubmited,
        decoration: InputDecoration
        (   
          suffixIcon: suffix,
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey),
          enabledBorder: OutlineInputBorder
          (
            borderSide: BorderSide(color: pColor),
          ),
          focusedBorder: OutlineInputBorder
          (
            borderSide: BorderSide(color: pColor),
          ) ,
          border:OutlineInputBorder
          (
            borderSide: BorderSide(color: pColor),
          ),
        ),
      ),
    );
  }
}