import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled2/choyxona_app/constant/app_colors.dart';
import 'package:untitled2/choyxona_app/exe_model/rest.dart';
import 'package:untitled2/choyxona_app/presentation/screens/bottom_screens/location_rent/edit_rent/edit_buying_place.dart';
import 'package:untitled2/choyxona_app/presentation/widgets/navigators.dart';

class RentRest extends StatelessWidget {
  const RentRest({super.key});



  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _rentRest(context),
      ],
    );
  }

  _rentRest(context) {
    var resnt = restntList[1];
    return SizedBox(
      height: 470,
      width: double.infinity,
      child: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                height: 175,
                width: double.infinity,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade300,
                          spreadRadius: 2,
                          blurRadius: 2)
                    ],
                    color: Colors.white,
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Rest name",
                            style: GoogleFonts.nunitoSans(
                                fontWeight: FontWeight.bold, fontSize: 23)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            IconButton(
                                onPressed: () =>navigate(context, EditBuyingPlace(restnt: resnt)),
                                icon: Icon(
                                  CupertinoIcons.pencil_circle_fill,
                                  color: Colors.black,
                                )),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(CupertinoIcons.delete_solid,
                                    color: Colors.red))
                          ],
                        )
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _tableImage(),
                        _appData(),
                        _userRentData()
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  _tableImage() {
    return Container(
      height: 85,
      width: 85,
      color: AppColors.appColor,
      child: null,
    );
  }

  _restInfo(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _rowBuilder("Sana", "2-yanvar,2023"),
        _rowBuilder("Vaqt", "7:00 PM"),
        _rowBuilder("odam", "4"),
        _rowBuilder("Stol", "3"),
        ],
    );
  }

  _rowBuilder(String appData, String restData){
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: SizedBox(
        width: 150,
        height: 20,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(appData, style: GoogleFonts.nunitoSans()),
            Text(restData,
                style: GoogleFonts.nunitoSans(
                    fontSize: 13.04, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  _appData() {
    return SizedBox(
      height: 100,
      width: 50,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Sana", style: GoogleFonts.nunitoSans()),
          Text("Vaqt", style: GoogleFonts.nunitoSans()),
          Text("Odam", style: GoogleFonts.nunitoSans()),
          Text("Stol", style: GoogleFonts.nunitoSans()),
        ],
      ),
    );
  }

  _userRentData() {
    return SizedBox(
      height: 100,
      width: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("2-yanvar,2023",
              style: GoogleFonts.nunitoSans(
                  fontSize: 13.04, fontWeight: FontWeight.bold)),
          Text("7:00 PM",
              style: GoogleFonts.nunitoSans(
                  fontSize: 13.04, fontWeight: FontWeight.bold)),
          Text("4",
              style: GoogleFonts.nunitoSans(
                  fontSize: 13.04, fontWeight: FontWeight.bold)),
          Text("3",
              style: GoogleFonts.nunitoSans(
                  fontSize: 13.04, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
