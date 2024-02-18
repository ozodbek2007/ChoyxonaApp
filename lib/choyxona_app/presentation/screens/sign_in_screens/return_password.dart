import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:untitled2/choyxona_app/presentation/screens/sign_in_screens/password_change.dart';
import 'package:untitled2/choyxona_app/presentation/widgets/navigators.dart';

class ReturnPassword extends StatefulWidget {
  const ReturnPassword({super.key});

  @override
  State<ReturnPassword> createState() => _ReturnPasswordState();
}

class _ReturnPasswordState extends State<ReturnPassword> {
  final _characterController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isOpenn = false;
  bool _isOpenned = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Align(alignment:Alignment.topLeft,child: Text("Parolni tiklash",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 35),)),
            Gap(8),
            Align(
              alignment: Alignment.topLeft,
              child: Text("Iltimos, eslab qoladigan biror narsani yozing",style: TextStyle(color: Colors.grey.shade500,fontSize: 16),),
            ),
            const Gap(30),
            const Align(
                alignment: Alignment.topLeft,
                child: Text("New Password",style: TextStyle(fontSize: 14,color: Color(0xff000000)),)),
            Gap(6),
            TextField(
              obscureText: _isOpenn,
              controller: _characterController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: "8 ta belgidan iborat bo'lishi kerak",hintStyle: TextStyle(color: Colors.grey.shade500),
                suffixIcon: IconButton(
                  onPressed: (){
                    setState(() {
                      _isOpenn =!_isOpenn;
                    });
                  },icon: Icon(!_isOpenn ?Icons.remove_red_eye_outlined:Icons.visibility_off_outlined),
                ),
              ),
            ),
            Gap(15),
            const Align(
                alignment: Alignment.topLeft,
                child: Text("Confirm new Password",style: TextStyle(fontSize: 14,color: Color(0xff000000)),)),
            Gap(6),
            TextField(
              obscureText: _isOpenned,
              controller: _passwordController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: "Parolni qayta kiriting",hintStyle: TextStyle(color: Colors.grey.shade500),
                suffixIcon: IconButton(
                  onPressed: (){
                    setState(() {
                      _isOpenned =!_isOpenned;
                    });
                  },icon: Icon(!_isOpenned ?Icons.remove_red_eye_outlined:Icons.visibility_off_outlined),
                ),
              ),
            ),
            Gap(40),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: const Color(0xff0bff99),
                ),
                onPressed: (){
                  navigatePushRemove(context, PasswordChangedPage());
                },
                child: const Text("Tasdiqlash",style: TextStyle(color: Color(0xffffffff),fontWeight: FontWeight.bold,fontSize: 15),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}