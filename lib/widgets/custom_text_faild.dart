
import 'package:flutter/material.dart';

class CustomTextFaild extends StatelessWidget 
{
  final String hintText;
  const CustomTextFaild
  (
    {
      super.key, required this.hintText,
    }
  );

  @override
  Widget build(BuildContext context) 
  {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField
      (
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