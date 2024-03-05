import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled2/choyxona_app/constant/app_colors.dart';
import 'package:untitled2/choyxona_app/presentation/screens/sign_up_screens/country_location/country_page.dart';
import 'package:untitled2/choyxona_app/presentation/widgets/app_button.dart';
import 'package:untitled2/choyxona_app/presentation/widgets/navigators.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getTheLoc(),
    );
  }

  _getTheLoc(){
    return SingleChildScrollView(
      padding: EdgeInsets.all(20),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Gap(100),
            SizedBox(
              height: 280,
                width: 280,
                child: ClipRRect(borderRadius: BorderRadius.circular(1000),child: Image.asset("assets/img/location.png",height: double.infinity,fit: BoxFit.contain))),
            const Gap(60),
            buttonBuilder(() =>navigate(context, CountryPage()), "XUDUDNI TANLASH", AppColors.appColor, GoogleFonts.nunitoSans(), AppColors.appColor),
            const Gap(60),
            Text("ILOVA SIZ TANLAGAN XUDUDDA BO'KGAN OBYEKTLARNU KO'RSATADI.",style: GoogleFonts.nunitoSans())
          ],
        ),
      ),
    );
  }
}
