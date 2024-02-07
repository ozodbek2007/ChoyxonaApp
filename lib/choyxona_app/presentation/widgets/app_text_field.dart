import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField(this.hintText, this.isVisible, this.controller, this.myIcon);

  final String hintText;
  final bool isVisible;
  final TextEditingController controller;
  final IconButton myIcon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: isVisible,
      decoration: InputDecoration(
        suffixIcon: myIcon,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            width: 1,
            color: Colors.grey.shade300,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            width: 1,
            color: Colors.grey,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            width: 1,
            color: Colors.grey,
          ),
        ),
        fillColor: Colors.white,
        filled: true,
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey),
      ),
    );
  }
}
