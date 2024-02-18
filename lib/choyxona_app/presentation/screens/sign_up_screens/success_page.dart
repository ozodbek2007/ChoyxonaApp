import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:untitled2/choyxona_app/constant/app_colors.dart';
import 'package:untitled2/choyxona_app/constant/text_styles.dart';
import 'package:untitled2/choyxona_app/presentation/screens/main_page.dart';
import 'package:untitled2/choyxona_app/presentation/widgets/app_button.dart';
import 'package:untitled2/choyxona_app/presentation/widgets/navigators.dart';

class SuccessPage extends StatefulWidget {
  const SuccessPage({super.key});

  @override
  State<SuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _welcomeSection(),
    );
  }

  _welcomeSection() {
    return Center(
      child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Lottie.asset("assets/anim/anim1.json",width: 300,height:300),
              Text("Xush Kelibsiz!", style: TextStyles.titleTextStyle),
              const Gap(30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Text("Sizning registratsiyangiz muvaffaqiyatli yakunlandi",
                    style: TextStyles.descTextStyle),
              ),
              const Gap(120),
              buttonBuilder(
                  () =>navigatePushRemove(context, MainPage()),
                  "Davom Etish",
                  AppColors.appColor,
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  AppColors.appColor)
            ],
          )),
    );
  }
}
