import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:untitled2/choyxona_app/constant/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  static LatLng _pGooglePlex = LatLng(40.768810, 72.236282);
  final Uri url = Uri.parse("+998932038454");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 500,
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: _pGooglePlex,
                zoom: 14,
              ),
            ),
          ),
          TextButton(onPressed: () {
            showModalBottomSheet(context: context,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25)),
                ),
                builder: (BuildContext context) {
                  return SingleChildScrollView(
                    child: Container(
                      width: double.infinity,
                      height: 150,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: GestureDetector(
                                onTap: () {
                                  showModalBottomSheet(context: context,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(25),
                                            topRight: Radius.circular(25)),
                                      ),
                                      builder: (BuildContext context) {
                                        return Container(
                                          height: 650,
                                          width: double.infinity,
                                          child: SingleChildScrollView(
                                            child: Column(
                                              children: [
                                                const Gap(30),
                                                ListTile(
                                                  leading: ClipRRect(
                                                      borderRadius: BorderRadius
                                                          .circular(10),
                                                      child: Image.asset("assets/img/project_img.png")),
                                                  title: Text(
                                                    "Rose Garden Restaurant",
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 18),),
                                                  subtitle: Text(
                                                      "Ish vaqti,Saot 10:00 Dan 22:00 Gacha",
                                                      style: TextStyle(
                                                          color: Color(0xffA0A5BA),
                                                          fontSize: 14)),
                                                ),
                                                Gap(10),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment
                                                      .center,
                                                  children: [
                                                    Text("2x", style: TextStyle(
                                                        fontSize: 13,
                                                        color: Color(0xff646982)),),
                                                    Gap(5),
                                                    Text("Odam", style: TextStyle(
                                                      fontSize: 13,
                                                      color: Color(0xffA0A5BA),),),
                                                  ],
                                                ),
                                                Gap(10),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment
                                                      .center,
                                                  children: [
                                                    Text("108", style: TextStyle(
                                                        fontSize: 13,
                                                        color: Color(0xff646982)),),
                                                    Gap(5),
                                                    Text("Stol", style: TextStyle(
                                                      fontSize: 13,
                                                      color: Color(0xffA0A5BA),),),
                                                  ],
                                                ),
                                                Gap(30),
                                                Align(

                                                  alignment: Alignment.center,
                                                  child: Text("Nonushta",
                                                    style: GoogleFonts.montserrat(
                                                      fontSize: 40,
                                                      fontWeight: FontWeight.bold,),),
                                                ),
                                                Gap(2),
                                                Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "Taxminiy keladigan vaqt",
                                                    style: TextStyle(fontSize: 14,
                                                        color: Color(0xffA0A5BA)),),
                                                ),
                                                Gap(20),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment
                                                      .start,
                                                  children: [
                                                    Gap(15),
                                                    Icon(Icons.check_circle,
                                                      color: Color(0xff01DC82),),
                                                    Gap(17),
                                                    Text("Buyurtmangiz qabul qilindi",
                                                      style: TextStyle(fontSize: 13,
                                                        color: Color(0xff01DC82),),),
                                                  ],
                                                ),
                                                ListTile(
                                                  leading: Icon(CupertinoIcons
                                                      .ellipsis_circle_fill,
                                                    color: Color(0xff01DC82),),
                                                  title: Text(
                                                    "Restoran sizning joyingizni tayyorlamoqda",
                                                    style: TextStyle(fontSize: 13,
                                                      color: Color(0xffA0A5BA),),),
                                                ),
                                                Gap(10),
                                                Align(
                                                  alignment: Alignment.bottomCenter,
                                                  child: SingleChildScrollView(
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 130,
                                                      decoration: BoxDecoration(
                                                          borderRadius: BorderRadius
                                                              .only(
                                                            topLeft: Radius.circular(
                                                                15),
                                                            topRight: Radius.circular(
                                                                15),
                                                          ),
                                                          border: Border.all(width: 1,
                                                              color: Color(
                                                                  0xffA0A5BA))
                                                      ),
                                                      child: SingleChildScrollView(
                                                        child: Padding(
                                                          padding: EdgeInsets.all(10),
                                                          child: Row(
                                                            mainAxisAlignment: MainAxisAlignment
                                                                .center,
                                                            children: [
                                                              Container(
                                                                width: 300,
                                                                child: ListTile(
                                                                  leading: CircleAvatar(
                                                                    foregroundImage: AssetImage(
                                                                        "assets/img/james.png"),
                                                                  ),
                                                                  title: Text(
                                                                    "Abdullayev.O'",
                                                                    style: TextStyle(
                                                                        fontSize: 20,
                                                                        color: Color(
                                                                            0xff181C2E)),),
                                                                  subtitle: Text(
                                                                    "Manager'",
                                                                    style: TextStyle(
                                                                      fontSize: 14,
                                                                      color: Color(
                                                                          0xffA0A5BA),),
                                                                  ),
                                                                  trailing: FloatingActionButton(
                                                                    onPressed: () async {
                                                                      final Uri url = Uri(
                                                                          scheme: 'tel',
                                                                          path: "+998932038454"
                                                                      );
                                                                      if (await canLaunchUrl(
                                                                          url)) {
                                                                        await launchUrl(
                                                                            url);
                                                                      } else {
                                                                        print(
                                                                            "cannot launched");
                                                                      }
                                                                    },
                                                                    child: Icon(
                                                                      Icons.call,),
                                                                    shape: RoundedRectangleBorder(
                                                                        borderRadius: BorderRadius
                                                                            .circular(
                                                                            60)),
                                                                    backgroundColor: Color(
                                                                        0xff01DC82),
                                                                  ),
                                                                ),
                                                              ),
                                                              FloatingActionButton(
                                                                onPressed: () async {
                                                                  final Uri urll = Uri(
                                                                      scheme: 'sms',
                                                                      path: "+998932038454"
                                                                  );
                                                                  if (await canLaunchUrl(
                                                                      urll)) {
                                                                    await launchUrl(
                                                                        urll);
                                                                  } else {
                                                                    print(
                                                                        "cannot launched");
                                                                  }
                                                                },
                                                                child: Icon(Icons
                                                                    .message_outlined,
                                                                    color: Color(
                                                                        0xff01DC82)),
                                                                shape: RoundedRectangleBorder(
                                                                  borderRadius: BorderRadius
                                                                      .circular(60),),
                                                                backgroundColor: Colors
                                                                    .white,

                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      });
                                },
                                child: ListTile(
                                  leading: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset(
                                          "assets/img/project_img.png")),
                                  title: Text("Rose Garden Restaurant",
                                    style: TextStyle(fontWeight: FontWeight.bold,
                                        fontSize: 18),),
                                  subtitle: Text(
                                      "Ish vaqti,Saot 10:00 Dan 22:00 Gacha",
                                      style: TextStyle(
                                          color: Color(0xffA0A5BA), fontSize: 14)),
                                ),
                              ),
                            ),
                            Gap(10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("2x", style: TextStyle(
                                    fontSize: 13, color: Color(0xff646982)),),
                                Gap(5),
                                Text("Odam", style: TextStyle(
                                  fontSize: 13, color: Color(0xffA0A5BA),),),
                              ],
                            ),
                            Gap(10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("108", style: TextStyle(
                                    fontSize: 13, color: Color(0xff646982)),),
                                Gap(5),
                                Text("Stol", style: TextStyle(
                                  fontSize: 13, color: Color(0xffA0A5BA),),),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                });
          }, child: Text("Qardoshimni Ko'rsat",style: GoogleFonts.nunitoSans(color:AppColors.appColor))),
        ],
      ),
    );
  }
}