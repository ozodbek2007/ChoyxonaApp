import 'package:flutter/material.dart';

buttonBuilder(VoidCallback pressed, String childText,Color color,TextStyle textStyle,Color borderColor){
  return SizedBox(
    height: 60,
    width: double.infinity,
    child: ElevatedButton(
      onPressed: pressed, child: Text(childText,style:textStyle),
      style: ElevatedButton.styleFrom(
        side: BorderSide(
            color: borderColor
        ),
        elevation: 0,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
        ),
        backgroundColor: color,
      ),
    ),
  );
}