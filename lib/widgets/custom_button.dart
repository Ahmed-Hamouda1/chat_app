
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget 
{
  final String title;
  CustomButton
  (
    {
      super.key, required this.title, this.onTap
    }
  );
  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector
    (
      onTap: onTap,
      child: Container
      (
        margin: EdgeInsets.symmetric(vertical: 10),
        width: double.infinity,
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration
        (
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)
        ),
        child:Text
        (
          title,
          style: const TextStyle(
              color: Colors.blueGrey,
              fontWeight: FontWeight.bold,
              fontSize: 15),
        ),
      ),
    );
  }
}
