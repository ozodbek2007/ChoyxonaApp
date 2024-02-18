import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled2/choyxona_app/exe_model/rest.dart';
import 'package:untitled2/choyxona_app/presentation/widgets/navigators.dart';
import '../../../../constant/app_colors.dart';
import '../../../widgets/app_button.dart';
import '../../bottom_screens/borrom_search_page.dart';
import '../../bottom_screens/home_page.dart';
import '../../bottom_screens/location_page.dart';
import '../../bottom_screens/profile_page.dart';
import 'buying_place.dart';
import 'menu_screen.dart';
import 'reviews_screen.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key, required this.restnt});

  final Restnt restnt;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final List _screens = [
    HomePage(),
    LocationPage(),
    BottomSearchScreen(),
    ProfilePage()
  ];

  int _selectedIndex = 0;

  TextStyle greyTextStyle = TextStyle(color: Colors.grey);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: _selectedIndex == 0 ? _getTheRest() : _screens[_selectedIndex],
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
                            color: _selectedIndex == 0
                                ? Colors.white
                                : Colors.grey),
                      ),
                      label: ''),
                  BottomNavigationBarItem(
                      backgroundColor: Colors.black,
                      icon: Icon(CupertinoIcons.location_solid,
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
      ),
    );
  }

  _getTheRest() {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 275,
            width: double.infinity,
            child: Stack(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(35),
                    child: Image.asset(widget.restnt.img ?? "",
                        fit: BoxFit.cover)),
                Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.circular(35)),
                    )),
                Positioned(
                    top: 60,
                    left: 10,
                    child: Row(
                      children: [
                        Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                color: Colors.white30,
                                borderRadius: BorderRadius.circular(25)),
                            child: IconButton(
                                onPressed: () => navigatePop(context),
                                icon: Icon(Icons.arrow_back_ios,
                                    size: 18, color: Colors.white))),
                        Text("    Orqaga",
                            style: GoogleFonts.roboto(color: Colors.white))
                      ],
                    ))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(CupertinoIcons.star_fill, color: AppColors.appColor),
                    Text("  ${widget.restnt.rating}k",
                        style: GoogleFonts.rowdies(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                  ],
                ),
                const Gap(10),
                Text(
                  widget.restnt.name ?? "",
                  style: GoogleFonts.rowdies(fontSize: 24),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(CupertinoIcons.location_solid,
                        color: AppColors.appColor),
                    const Gap(10),
                    Text(widget.restnt.location ?? "",
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.bold, fontSize: 10))
                  ],
                ),
                const Gap(20),
                Text(widget.restnt.desc ?? "",
                    style:
                        GoogleFonts.roboto(fontSize: 12, color: Colors.grey)),
                const Gap(30),
                Text("+${widget.restnt.managerNum} - Manager Nomeri",
                    style: GoogleFonts.roboto(color: Colors.grey)),
                const Gap(10),
                Text("+${widget.restnt.restNum} - Restaurant Nomeri",
                    style: GoogleFonts.roboto(color: Colors.grey)),
              ],
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                    border: Border.all(color: Colors.grey),
                  ),
                  child: TabBar(
                    unselectedLabelColor: Colors.red,
                    dividerColor: Colors.white,
                    indicatorColor: AppColors.appColor,
                    tabs: [
                      Tab(child: _tabBuilder("Menu")),
                      Tab(child: _tabBuilder("Reviews")),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: SizedBox(
                  height: 600,
                  width: double.infinity,
                  child: TabBarView(
                    children: [MenuScreen(), ReviewsScreen()],
                  ),
                ),
              ),
              _restFacilities(),
              Padding(
                  padding: EdgeInsets.only(bottom: 20, left: 40, right: 40),
                  child: buttonBuilder(
                      () =>
                          navigate(context, BuyingPlace(restnt: widget.restnt)),
                      "JOYNI BUYURTMA QILISH",
                      AppColors.appColor,
                      TextStyle(color: Colors.white),
                      AppColors.appColor))
            ],
          )
        ],
      ),
    );
  }

  _tabBuilder(String name) {
    return Container(
        height: 50,
        width: 100,
        decoration: BoxDecoration(
            color: Color(0xffd3fded), borderRadius: BorderRadius.circular(12)),
        child: Center(
            child: Text(name,
                style: TextStyle(
                    color: AppColors.appColor, fontWeight: FontWeight.bold))));
  }

  _restFacilities() {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Restoranlarning Qulayliklari",
            style: TextStyle(color: Colors.grey, fontSize: 18),
          ),
          const Gap(10),
          SizedBox(
            height: 100,
            width: double.infinity,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _facilityBuilder(
                    'Alkagol', 'assets/img/google.png', Color(0xffd3fded)),
                _facilityBuilder(
                    'Hookah', 'assets/img/google.png', Colors.black26),
                _facilityBuilder(
                    'Musiqa', 'assets/img/google.png', Color(0xffd3fded)),
                _facilityBuilder(
                    'Sigaret', 'assets/img/google.png', Color(0xffd3fded)),
                _facilityBuilder(
                    "O'yin", 'assets/img/google.png', Color(0xffd3fded)),
              ],
            ),
          )
        ],
      ),
    );
  }

  _facilityBuilder(String name, String imagePath, Color color) {
    return InkWell(
      onTap: () {},
      child: SizedBox(
        height: 100,
        width: 80,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                  color: color,
                  // color: Color(0xffd3fded),
                  borderRadius: BorderRadius.circular(35),
                  image: DecorationImage(image: AssetImage(imagePath))),
              child: null,
            ),
            const Gap(5),
            Text(
              name,
              style: greyTextStyle,
            )
          ],
        ),
      ),
    );
  }
}
