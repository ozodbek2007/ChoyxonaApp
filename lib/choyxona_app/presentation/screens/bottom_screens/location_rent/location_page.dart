import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled2/choyxona_app/constant/text_styles.dart';
import 'package:untitled2/choyxona_app/presentation/screens/bottom_screens/location_rent/rent_rest.dart';

import '../../../../exe_model/rest.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({super.key});

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Align(
        alignment: Alignment.bottomCenter,
        child: InkWell(
          onTap: (){},
          child: Ink(
            child: Container(
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade300,
                        spreadRadius: 2,
                        blurRadius: 2
                    )
                  ],
                  color: Colors.white,
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(100)),
              child: Center(
                child: Icon(Icons.add),
              ),
            ),
          ),
        ),
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: _getBoughtRest(),
    );
  }

  _getBoughtRest() {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Gap(60),
          updateAppBar(),
          Text("Sizning buyurtmalaringiz", style: TextStyles.titleTextStyle),
          RentRest()
        ],
      ),
    );
  }

  String _district = 'Andijon';

  updateAppBar() {
    return SizedBox(
      height: 60,
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Color(0xffeaeef2)),
                  child: Center(
                      child: IconButton(
                          splashRadius: 50,
                          splashColor: Colors.red,
                          onPressed: () {},
                          icon: Icon(CupertinoIcons.list_bullet_indent))),
                ),
                const Gap(20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      "assets/img/choyxona_app1.png",
                      fit: BoxFit.cover,
                      height: 15,
                      width: 140,
                    ),
                    PopupMenuButton(
                      color: Colors.white,
                      itemBuilder: (BuildContext context) {
                        return <PopupMenuEntry<String>>[
                          PopupMenuItem(
                              textStyle:
                                  GoogleFonts.nunitoSans(color: Colors.grey),
                              value: "Andijon",
                              child: Text(
                                "Andijon",
                                style: GoogleFonts.nunitoSans(),
                              )),
                          PopupMenuItem(
                              textStyle:
                                  GoogleFonts.nunitoSans(color: Colors.grey),
                              value: "Toshkent",
                              child: Text(
                                "Toshkent",
                                style: GoogleFonts.nunitoSans(),
                              )),
                          PopupMenuItem(
                              textStyle:
                                  GoogleFonts.nunitoSans(color: Colors.grey),
                              value: "Farg'ona",
                              child: Text(
                                "Farg'ona",
                                style: GoogleFonts.nunitoSans(),
                              )),
                        ];
                      },
                      onSelected: (String value) {
                        setState(() {
                          _district = value;
                        });
                      },
                      child: Row(
                        children: [
                          Text(
                            _district,
                            style: GoogleFonts.nunitoSans(color: Colors.grey),
                          ),
                          Icon(
                            CupertinoIcons.arrowtriangle_down_fill,
                            size: 13,
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
