import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:untitled2/choyxona_app/presentation/screens/main_page.dart';
import 'package:untitled2/choyxona_app/presentation/screens/sign_in_screens/login_page.dart';
import 'package:untitled2/choyxona_app/presentation/widgets/navigators.dart';

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
            Gap(101),
            Align(
              alignment: Alignment.center,
              child: Lottie.asset("assets/anim/anim1.json",width: 300,height:300),
            ),
            Align(alignment:Alignment.center,child: Text("Parol o'zgartirildi",style: GoogleFonts.nunitoSans(fontWeight: FontWeight.bold,fontSize: 35),)),
            Gap(10),
            Align(alignment:Alignment.center,child: Text("Parolingiz muvaffaqiyatli",style: GoogleFonts.nunitoSans(fontSize: 16,color: Colors.grey.shade500),)),
            Align(alignment:Alignment.center,child: Text("o'zgartirild",style: GoogleFonts.nunitoSans(fontSize: 16,color: Colors.grey.shade500),)),
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
                onPressed: ()=>navigatePushRemove(context, LoginPage()),
                child:  Text("Davom ettirish",style: GoogleFonts.nunitoSans(color: Color(0xffffffff),fontWeight: FontWeight.bold,fontSize: 15),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}