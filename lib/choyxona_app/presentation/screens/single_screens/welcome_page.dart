import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:untitled2/choyxona_app/constant/app_colors.dart';
import 'package:untitled2/choyxona_app/presentation/screens/sign_screens/register_page.dart';
import 'package:untitled2/choyxona_app/presentation/widgets/navigators.dart';

import '../../widgets/app_button.dart';

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
            const Text("Ilova bilan tanishing",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35)),
            const Gap(10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 45),
        
              child: const Text(
                  "Ilova bilan tanishingIlova bilan tanishing Ilova bilan tanishing",
                  style: TextStyle(fontSize: 20)),
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
          buttonBuilder(() {}, "Tizmiga Kirish", AppColors.appColor, TextStyle(color: Colors.white,fontWeight: FontWeight.bold),AppColors.appColor),
          const Gap(20),
          buttonBuilder(() =>navigate(context, RegisterPage()), "Ro'yhatdan O'tish", Colors.white, TextStyle(color: Colors.black,fontWeight: FontWeight.bold),Colors.black),
          const Gap(15),
        ],
      ),
    );
  }

}
