import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled2/choyxona_app/constant/app_colors.dart';
import 'package:untitled2/choyxona_app/exe_model/rest.dart';
import 'package:untitled2/choyxona_app/presentation/screens/tab_bar_screens/detail_screens_and_tabs/buying_table.dart';
import 'package:untitled2/choyxona_app/presentation/widgets/app_button.dart';
import 'package:untitled2/choyxona_app/presentation/widgets/navigators.dart';
import '../../bottom_screens/search/borrom_search_page.dart';
import '../../bottom_screens/home_page.dart';
import '../../bottom_screens/location_rent/location_page.dart';
import '../../bottom_screens/profile/profile_page.dart';

class BuyingPlace extends StatefulWidget {
  const BuyingPlace({super.key, required this.restnt});

  final Restnt restnt;

  @override
  State<BuyingPlace> createState() => _BuyingPlaceState();
}

class _BuyingPlaceState extends State<BuyingPlace> {
  bool sizedTapped = true;

  int _selectedIndex = 0;

  void toggleSize() {
    setState(() {
      sizedTapped = false;
    });
  }

  final List _screens = [
    HomePage(),
    LocationPage(),
    BottomSearchScreen(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: _selectedIndex == 0 ? _getBuyingTime() : _screens[_selectedIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 10, left: 15, right: 15),
        child: SizedBox(
          height: 80,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: BottomNavigationBar(
              onTap: (i) {
                setState(() {
                  _selectedIndex = i;
                });
              },
              items: [
                BottomNavigationBarItem(
                    backgroundColor: Colors.black,
                    icon: Padding(
                      padding: const EdgeInsets.only(top: 18),
                      child: Icon(CupertinoIcons.home,
                          color:
                              _selectedIndex == 0 ? Colors.white : Colors.grey),
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    backgroundColor: Colors.black,
                    icon: Icon(Icons.location_on_rounded,
                        color:
                            _selectedIndex == 1 ? Colors.white : Colors.grey),
                    label: ''),
                BottomNavigationBarItem(
                    backgroundColor: Colors.black,
                    icon: Icon(CupertinoIcons.search,
                        color:
                            _selectedIndex == 2 ? Colors.white : Colors.grey),
                    label: ''),
                BottomNavigationBarItem(
                    backgroundColor: Colors.black,
                    icon: Icon(CupertinoIcons.person,
                        color:
                            _selectedIndex == 3 ? Colors.white : Colors.grey),
                    label: ''),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _getBuyingTime() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(19),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Gap(40),
          updateAppBar(),
          const Gap(20),
          Text("${widget.restnt.name} Joy band qilish",
              style: GoogleFonts.nunitoSans(
                  fontWeight: FontWeight.bold, fontSize: 25)),
          const Gap(40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Brom qilish sanasini tanlang",
                style: GoogleFonts.nunitoSans(),
              ),
              SizedBox(
                height: 30,
                width: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "2-7 yanvar",
                      style: GoogleFonts.nunitoSans(),
                    ),
                    Icon(
                      Icons.skip_next_rounded,
                      size: 20,
                    )
                  ],
                ),
              )
            ],
          ),
          // const Gap(10),
          _getTheDate(),
          const Gap(25),
          Text(
            "Brom qilish vaqtini tanlang",
            style: GoogleFonts.nunitoSans(),
          ),
          // const Gap(10),
          _getTimeToBuy(),
          const Gap(25),
          Text(
            "Odamlar sonini tanlang",
            style: GoogleFonts.nunitoSans(),
          ),
          // const Gap(10),
          _getNumberPeople(),
          Padding(
            padding: EdgeInsets.only(
              top: 50,
              bottom: 20,
              left: 40,
              right: 40,
            ),
            child: buttonBuilder(
                () => navigate(context, BuyingTable(restnt: widget.restnt)),
                "KEYINGISI",
                AppColors.appColor,
                GoogleFonts.nunitoSans(
                    color: Colors.white, fontWeight: FontWeight.bold),
                AppColors.appColor),
          )
        ],
      ),
    );
  }

  String _district = "Andijon";

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

  _getTheDate() {
    return SizedBox(
      height: 70,
      width: double.infinity,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: dateList.length,
          itemBuilder: (context, index) {
            MyDates data = dateList[index];
            return Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 5, left: 15.0),
              child: AnimatedContainer(
                curve: Curves.fastOutSlowIn,
                duration: const Duration(seconds: 1),
                width: 50,
                height: data.isTrue ? 100 : 50,
                decoration: BoxDecoration(
                    color: data.isTrue ? Colors.white : AppColors.appColor,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 3,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ]),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      data.isTrue = !data.isTrue;
                    });
                  },
                  child: Center(
                    child: Text("${data.date}",
                        style: GoogleFonts.nunitoSans(
                            color: data.isTrue ? Colors.black : Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
            );
          }),
    );
  }

  _getTimeToBuy() {
    return SizedBox(
      height: 70,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: timeList.length,
        itemBuilder: (context, index) {
          MyTimes time = timeList[index];
          return Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 5, left: 15.0),
            child: InkWell(
              onTap: () {
                setState(() {
                  time.isTrue = !time.isTrue;
                });
              },
              child: AnimatedContainer(
                curve: Curves.fastOutSlowIn,
                duration: const Duration(seconds: 1),
                width: 150,
                height: time.isTrue ? 100 : 50,
                decoration: BoxDecoration(
                    color: time.isTrue ? Colors.white : AppColors.appColor,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 3,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ]),
                child: Center(
                  child: Text("${time.hour}:${time.minute}",
                      style: GoogleFonts.nunitoSans(
                          color: time.isTrue ? Colors.black : Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold)),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  _getNumberPeople() {
    return SizedBox(
      height: 70,
      width: double.infinity,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: dateList.length,
          itemBuilder: (context, index) {
            MyNumberH data = numberList[index];
            return Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 5, left: 15.0),
              child: InkWell(
                onTap: () {
                  setState(() {
                    data.isTrue = !data.isTrue!;
                  });
                },
                child: AnimatedContainer(
                  curve: Curves.fastOutSlowIn,
                  duration: const Duration(seconds: 1),
                  width: 50,
                  height: data.isTrue! ? 100 : 50,
                  decoration: BoxDecoration(
                      color: data.isTrue! ? Colors.white : AppColors.appColor,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 3,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ]),
                  child: Center(
                    child: Text("${data.pNum}",
                        style: GoogleFonts.nunitoSans(
                            color: data.isTrue! ? Colors.black : Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
            );
          }),
    );
  }
}

class MyDates {
  int date;
  bool isTrue;

  MyDates({required this.date, required this.isTrue});
}

final dateList = [
  MyDates(date: 2, isTrue: true),
  MyDates(date: 3, isTrue: true),
  MyDates(date: 4, isTrue: true),
  MyDates(date: 5, isTrue: true),
  MyDates(date: 6, isTrue: true),
  MyDates(date: 7, isTrue: true),
  MyDates(date: 8, isTrue: true),
];

class MyTimes {
  int hour;
  int minute;
  bool isTrue;

  MyTimes({required this.hour, required this.minute, required this.isTrue});
}

final timeList = [
  MyTimes(hour: 6, minute: 30, isTrue: true),
  MyTimes(hour: 7, minute: 30, isTrue: true),
  MyTimes(hour: 8, minute: 30, isTrue: true),
  MyTimes(hour: 9, minute: 30, isTrue: true),
];

class MyNumberH {
  int? pNum;
  bool? isTrue;

  MyNumberH({required this.pNum, required this.isTrue});
}

final numberList = [
  MyNumberH(pNum: 1, isTrue: true),
  MyNumberH(pNum: 2, isTrue: true),
  MyNumberH(pNum: 3, isTrue: true),
  MyNumberH(pNum: 4, isTrue: true),
  MyNumberH(pNum: 5, isTrue: true),
  MyNumberH(pNum: 6, isTrue: true),
  MyNumberH(pNum: 7, isTrue: true),
  MyNumberH(pNum: 8, isTrue: true),
];
