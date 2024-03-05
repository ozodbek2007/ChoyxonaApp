import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled2/choyxona_app/constant/app_colors.dart';

class ReviewsScreen extends StatefulWidget {
  const ReviewsScreen({super.key});

  @override
  State<ReviewsScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<ReviewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _getComments());
  }

  _getComments() {
    return Column(
      children: [
        SizedBox(
          height: 550,
          width: double.infinity,
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: Container(
                  padding: EdgeInsets.only(left: 5),
                  height: 110,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.grey.shade400)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Gap(10),
                      _getTheUser(),
                      Text("Comment, I love this UI very much",
                          style: GoogleFonts.nunitoSans(color: AppColors.appColor))
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        const Gap(10),
        InkWell(
          onTap: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Hammasi", style: GoogleFonts.nunitoSans(color: Color(0xff0084fd))),
              Icon(
                CupertinoIcons.forward,
                size: 20,
                color: Color(0xff0084fd),
              )
            ],
          ),
        )
      ],
    );
  }

  _getTheUser() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 70,
          width: 70,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset("assets/img/facebook.png", fit: BoxFit.cover),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("@LouiseGreyrat", style: GoogleFonts.nunitoSans(color: AppColors.appColor)),
            Text("1 day ago", style: GoogleFonts.nunitoSans(color: Colors.grey.shade400)),
          ],
        ),
        const Gap(50),
        _starts()
      ],
    );
  }

  _starts() {
    return SizedBox(
      height: 20,
      width: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Icon(Icons.star, color: AppColors.appColor, size: 20);
        },
      ),
    );
  }
}
