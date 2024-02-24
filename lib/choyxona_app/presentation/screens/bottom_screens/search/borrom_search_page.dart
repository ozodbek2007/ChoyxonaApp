import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled2/choyxona_app/constant/app_colors.dart';
import 'package:untitled2/choyxona_app/constant/leading_icon.dart';

import '../../../widgets/navigators.dart';
import 'key_search.dart';

class BottomSearchScreen extends StatefulWidget {
  const BottomSearchScreen({super.key});

  @override
  State<BottomSearchScreen> createState() => _LocationPageState();
}

class _LocationPageState extends State<BottomSearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainTheme(context),
      bottomNavigationBar: Center(
        child: _getSearchSection(),
      ),
    );
  }

  _getSearchSection() {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Gap(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              leadingIconGrey(context),
              Text(
                "    Qidirmoq",
                style: GoogleFonts.nunitoSans(fontSize: 18),
              ),
            ],
          ),
          const Gap(15),
          _searchTextField(),
          const Gap(15),
          Text(
            "    Oxirgi Kalit So'zlari",
            style: GoogleFonts.nunitoSans(fontSize: 25),
          ),
          const Gap(15),
          _keySection(),
          const Gap(15),
          Text(
            "    Tavsiya Etilgan Restaranlar",
            style: GoogleFonts.nunitoSans(
                fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const Gap(15),
          _suggestRest()
        ],
      ),
    );
  }

  _searchTextField() {
    return TextField(
      onTap: () {},
      decoration: InputDecoration(
        hintText: "Restaurant",
        hintStyle: GoogleFonts.nunitoSans(color: Colors.grey),
        prefixIcon: Icon(CupertinoIcons.search),
        suffixIconColor: Colors.grey.shade400,
        suffixIcon: Icon(CupertinoIcons.xmark_circle_fill),
        prefixIconColor: Colors.grey.shade400,
        fillColor: Colors.white,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.grey.shade400),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.grey.shade800),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.grey.shade400),
        ),
      ),
    );
  }



  List _keyWords = [
    "Burger",
    "Sandwich",
    "Pizza",
    "Gamburger",
    "Chips",
    "Nonburger",
    "Kfc",
  ];

  _keySection() {
    return SizedBox(
      height: 45,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _keyWords.length,
        itemBuilder: (context, index) {
          var burger = _keyWords[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: InkWell(
              onTap: () => navigate(context, DetailedKeyWord(keyWord: burger)),
              child: Container(
                height: 45,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Color(0xfff4f4f4),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Center(
                  child: Text(
                    "$burger",
                    style: GoogleFonts.nunitoSans(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  List _suggestRestList = [
    "Pepsi",
    "Cola",
    "Og'alar",
    "Dugonalar",
  ];

  _suggestRest() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: SizedBox(
        height: 350,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          itemCount: _suggestRestList.length,
          itemBuilder: (context, index) {
            var ozotbek = _suggestRestList[index];
            return InkWell(
              onTap: () {},
              child: Container(
                height: 80,
                width: double.infinity,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 70,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Color(0xff97a7b7),
                          ),
                          child: null,
                        ),
                        const Gap(20),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "$ozotbek Restaurant",
                              style: GoogleFonts.nunitoSans(fontSize: 18),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(CupertinoIcons.star,
                                    color: AppColors.appColor),
                                Text(
                                  '  4.7',
                                  style: GoogleFonts.nunitoSans(
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                    Divider(color: Colors.grey.shade300)
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
