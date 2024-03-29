import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled2/choyxona_app/constant/app_colors.dart';
import 'package:untitled2/choyxona_app/presentation/screens/sign_in_screens/login_page.dart';
import 'package:untitled2/choyxona_app/presentation/widgets/navigators.dart';

import '../../widgets/app_button.dart';
import '../sign_up_screens/register_page.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _allData());
  }

  _allData() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Gap(140),
            ClipRRect(
                borderRadius: BorderRadius.circular(27),
                child: Image.asset("assets/img/welcome.png",
                    fit: BoxFit.cover, width: 150, height: 150)),
            const Gap(95),
             Text("Ilova bilan tanishing",
                style: GoogleFonts.nunitoSans(fontWeight: FontWeight.bold, fontSize: 35)),
            const Gap(10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
        
              child:  Text(
                  "Ilova bilan tanishingIlova bilan tanishing Ilova bilan tanishing",
                  style: GoogleFonts.nunitoSans(fontSize: 20)),
            ),
            const Gap(140),
            _loginAndRegisterButtons()
          ],
        ),
      ),
    );
  }
  _loginAndRegisterButtons(){
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          buttonBuilder(() =>navigate(context, LoginPage()), "Tizmiga Kirish", AppColors.appColor, GoogleFonts.nunitoSans(color: Colors.white,fontWeight: FontWeight.bold),AppColors.appColor),
          const Gap(20),
          buttonBuilder(() =>navigate(context, RegisterPage()), "Ro'yhatdan O'tish", Colors.white, GoogleFonts.nunitoSans(color: Colors.black,fontWeight: FontWeight.bold),Colors.black),
          const Gap(15),
        ],
      ),
    );
  }

}
