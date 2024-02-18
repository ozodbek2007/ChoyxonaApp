import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:untitled2/choyxona_app/constant/app_colors.dart';
import 'package:untitled2/choyxona_app/constant/text_styles.dart';
import 'package:untitled2/choyxona_app/exe_model/rest.dart';
import 'package:untitled2/choyxona_app/presentation/screens/main_page.dart';
import 'package:untitled2/choyxona_app/presentation/widgets/app_button.dart';
import 'package:untitled2/choyxona_app/presentation/widgets/navigators.dart';

class CongratsPlace extends StatelessWidget {
  const CongratsPlace({super.key,required this.restnt});

 final Restnt restnt;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _congratsSection(context),
    );
  }
  _congratsSection(BuildContext context){
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Gap(100),
          Lottie.asset("assets/anim/anim1.json",width: 300,height:300),
          Text("Tabriklaymiz",style: TextStyles.titleTextStyle),
          const Gap(10),
          Text("Sizning joyingiz bron qilindi!",style: TextStyles.descTextStyle),
          const Gap(50),
          buttonBuilder(() =>navigatePushRemove(context, MainPage()), "BAJARILDI", AppColors.appColor, TextStyle(color: Colors.white), AppColors.appColor)
        ],
      ),
    );
  }
}
