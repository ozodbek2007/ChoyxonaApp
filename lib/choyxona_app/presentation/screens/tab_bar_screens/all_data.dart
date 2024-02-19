import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled2/choyxona_app/constant/app_colors.dart';
import 'package:untitled2/choyxona_app/exe_model/rest.dart';
import 'package:untitled2/choyxona_app/presentation/widgets/navigators.dart';

import 'detail_screens_and_tabs/detail_screen.dart';

class AllData extends StatefulWidget {
  const AllData({super.key});

  @override
  State<AllData> createState() => _AllDataState();
}

class _AllDataState extends State<AllData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _restaurantBuilder(),
    );
  }
  _restaurantBuilder(){
    return ListView.builder(
      itemCount: restntList.length,
      itemBuilder: (context, index){
        final data = restntList[index];
        return InkWell(
          onTap:()=>navigate(context, DetailScreen(restnt: data)),
          child: Padding(
            padding: const EdgeInsets.only(right: 24,bottom: 10,left: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 160,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(data.img ?? "",fit: BoxFit.cover),
                  ),
                ),
                const Gap(15),
                Text(data.name ?? "",style: GoogleFonts.nunitoSans(fontSize: 20),),
                const Gap(15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(CupertinoIcons.star,color: AppColors.appColor),
                    Text("  ${data.rating}",style: GoogleFonts.nunitoSans(fontSize: 18,fontWeight: FontWeight.bold)),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
