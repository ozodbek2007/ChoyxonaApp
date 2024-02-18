import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:untitled2/choyxona_app/presentation/screens/main_page.dart';

class PasswordChangedPage extends StatefulWidget {
  const PasswordChangedPage({super.key});

  @override
  State<PasswordChangedPage> createState() => _PasswordChangedPageState();
}

class _PasswordChangedPageState extends State<PasswordChangedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Gap(100),
            Align(
              alignment: Alignment.center,
              child: Lottie.asset("assets/anim/anim1.json",width: 300,height:300),
            ),
            Align(alignment:Alignment.center,child: Text("Parol o'zgartirildi",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 35),)),
            Gap(10),
            Align(alignment:Alignment.center,child: Text("Parolingiz muvaffaqiyatli",style: TextStyle(fontSize: 16,color: Colors.grey.shade500),)),
            Align(alignment:Alignment.center,child: Text("o'zgartirild",style: TextStyle(fontSize: 16,color: Colors.grey.shade500),)),
            Gap(30),
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
                  Navigator.of(context).push(CupertinoPageRoute(builder: (context)=> MainPage()));
                },
                child: const Text("Davom ettirish",style: TextStyle(color: Color(0xffffffff),fontWeight: FontWeight.bold,fontSize: 15),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}