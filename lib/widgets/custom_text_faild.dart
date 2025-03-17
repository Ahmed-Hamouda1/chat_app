
import 'package:flutter/material.dart';

class CustomTextFaild extends StatelessWidget 
{
  final String hintText;
  Color pColor=Colors.white;
  Widget? suffix;
  CustomTextFaild
  (
    {
      super.key, required this.hintText, this.onChange , required this.pColor,this.suffix
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
        style: TextStyle(color: pColor),
        onChanged: onChange,
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