import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled2/choyxona_app/constant/app_colors.dart';
import 'package:untitled2/choyxona_app/constant/leading_icon.dart';
import 'package:untitled2/choyxona_app/constant/text_styles.dart';
import 'package:untitled2/choyxona_app/presentation/screens/main_page.dart';
import 'package:untitled2/choyxona_app/presentation/screens/sign_up_screens/country_location/country_page.dart';
import 'package:untitled2/choyxona_app/presentation/widgets/app_button.dart';
import 'package:untitled2/choyxona_app/presentation/widgets/navigators.dart';

class DistrictPage extends StatefulWidget {
  const DistrictPage({super.key});

  @override
  State<DistrictPage> createState() => _CountryPageState();
}

class _CountryPageState extends State<DistrictPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainTheme(context),
      body: Center(
        child: _countrySection(),
      ),
    );
  }

  final List _country = [
    "Andijon",
    "Buxoro",
    "Fargʻona",
    "Jizzax",
    "Xorazm",
    "Namangan",
    "Navoiy",
    "Qashqadaryo",
    "Qoraqalpogʻiston",
    "Samarqand",
    "Sirdaryo ",
    "Surxondaryo",
    "Toshkent"
  ];

  int _currentIndex = 0;


  _countrySection(){
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Text("Viloyatni Tanlang",style: TextStyles.titleTextStyle,),
          _buildCarusel(),
          buttonBuilder(() =>navigate(context, MainPage()), "Davom Etish", AppColors.appColor, GoogleFonts.nunitoSans(fontWeight: FontWeight.bold,fontSize: 20), AppColors.appColor)
        ],
      ),
    );
  }

  _buildCarusel() {
    return  SizedBox(
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
