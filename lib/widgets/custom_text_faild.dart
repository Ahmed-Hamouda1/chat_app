
import 'package:flutter/material.dart';

class CustomTextFaild extends StatelessWidget 
{
  final String hintText;
  CustomTextFaild
  (
    {
      super.key, required this.hintText, this.onChange
    }
  );
  Function(String)? onChange;

  @override
  Widget build(BuildContext context) 
  {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField
      (
        //keyboardType: TextInputType.,
        validator: (data)
        {
          if(data!.isEmpty)
            return "is empty";
        },
        style: TextStyle(color: Colors.white),
        onChanged: onChange,
        decoration: InputDecoration
        (   
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey),
          enabledBorder:const OutlineInputBorder
          (
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: const OutlineInputBorder
          (
            borderSide: BorderSide(color: Colors.white),
          ) ,
          border:const OutlineInputBorder
          (
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
      ),
    );
  }
}