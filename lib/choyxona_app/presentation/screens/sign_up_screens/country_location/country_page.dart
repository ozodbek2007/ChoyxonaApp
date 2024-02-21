import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled2/choyxona_app/constant/leading_icon.dart';
import 'package:untitled2/choyxona_app/presentation/screens/sign_up_screens/country_location/district_page.dart';
import 'package:untitled2/choyxona_app/presentation/widgets/navigators.dart';

import '../../../../constant/app_colors.dart';
import '../../../../constant/text_styles.dart';
import '../../../widgets/app_button.dart';

class CountryPage extends StatefulWidget {
  const CountryPage({super.key});

  @override
  State<CountryPage> createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainTheme(context),
      body: _getCountry(),
    );
  }
  _getCountry(){
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Gap(80),
          Text("Davlatni tanlash",style: TextStyles.titleTextStyle,),
          _buildCarusel(),
          buttonBuilder(() =>navigate(context, DistrictPage()), "Keyingisi", AppColors.appColor, GoogleFonts.nunitoSans(fontWeight: FontWeight.bold,fontSize: 20), AppColors.appColor)
        ],
      ),
    );
  }

  int _currentIndex = 0;
  final List _country = [
    "O'zbekiston",
    "Rossiya",
    "AQSh",
    "Xitoy",
    "Qozog'iston",
    "Turkiya",
    "Malayziya",
    "Fransiya",
    "Germaniya",
    "Yaponiya",
    "Kanada",
    "Avstraliya",
    "Britaniya",
    "Italiya",
    "Shveytsariya",
    "Eron",
    "Tojikiston",
    "Turkmaniston",
    "Qirg'iziston",
    "Koreya",
  ];

  _buildCarusel(){
    return SizedBox(
      height: 600,
      width: double.infinity,
      child: CarouselSlider.builder(
        itemCount: _country.length,
        options: CarouselOptions(
          scrollDirection: Axis.vertical,
          height: 600.0,
          viewportFraction: 0.1,
          initialPage: 0,
          enlargeCenterPage: true,
          onPageChanged: (index, reason) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
        itemBuilder: (BuildContext context, int index, int realIndex) {
          return _currentIndex == index ?
          Center(
            child: Container(
              decoration: BoxDecoration(
                  border: Border.symmetric(
                      horizontal: BorderSide(
                          width: 2,
                          color: AppColors.appColor
                      )
                  )
              ),
              child: Text(
                _country[index],
                style: GoogleFonts.nunitoSans(
                  color: _currentIndex == index ? AppColors.appColor : Colors.black,
                  fontSize: _currentIndex == index ? 40 : 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
              :
          Center(
            child: Text(
              _country[index],
              style: GoogleFonts.nunitoSans(
                color: _currentIndex == index ? AppColors.appColor : Colors.black,
                fontSize: _currentIndex == index ? 45 : 35,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        },
      ),
    );
  }
}
