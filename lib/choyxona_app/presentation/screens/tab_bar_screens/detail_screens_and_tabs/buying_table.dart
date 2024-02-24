import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled2/choyxona_app/constant/app_colors.dart';
import 'package:untitled2/choyxona_app/exe_model/rest.dart';
import 'package:untitled2/choyxona_app/presentation/screens/tab_bar_screens/detail_screens_and_tabs/buoght_table.dart';
import 'package:untitled2/choyxona_app/presentation/widgets/app_button.dart';
import 'package:untitled2/choyxona_app/presentation/widgets/navigators.dart';

import '../../bottom_screens/search/borrom_search_page.dart';
import '../../bottom_screens/home_page.dart';
import '../../bottom_screens/location_rent/location_page.dart';
import '../../bottom_screens/profile/profile_page.dart';

class BuyingTable extends StatefulWidget {
  const BuyingTable({super.key,required this.restnt});

  final Restnt restnt;

  @override
  State<BuyingTable> createState() => _BuyingTableState();
}

class _BuyingTableState extends State<BuyingTable> {

 int _selectedIndex = 0;


 final List _screens = [
   HomePage(),
   LocationPage(),
   BottomSearchScreen(),
   ProfilePage()
 ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _selectedIndex ==0 ? _getBuyingTable() : _screens[_selectedIndex],
      bottomNavigationBar: Padding(padding: EdgeInsets.all(20),
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
                    child: Icon(CupertinoIcons.home,color: _selectedIndex == 0 ? Colors.white : Colors.grey),
                  ),
                  label: ''),
              BottomNavigationBarItem(
                  backgroundColor: Colors.black,
                  icon: Icon(Icons.location_on_rounded,color: _selectedIndex == 1 ? Colors.white : Colors.grey),
                  label: ''),
              BottomNavigationBarItem(
                  backgroundColor: Colors.black,
                  icon: Icon(CupertinoIcons.search,color: _selectedIndex == 2 ? Colors.white : Colors.grey),
                  label: ''),
              BottomNavigationBarItem(
                  backgroundColor: Colors.black,
                  icon: Icon(CupertinoIcons.person,color: _selectedIndex == 3 ? Colors.white : Colors.grey),
                  label: ''),
            ],
          ),
        ),
      ),
      ),
    );
  }
  _getBuyingTable() {
    return SizedBox(
      height: double.infinity,
      width: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(40),
            updateAppBar(),
            const Gap(20),
            Text("${widget.restnt.name} Joy band qilish", style: GoogleFonts.nunitoSans(fontWeight: FontWeight.bold,
                fontSize: 25)),
             Gap(MediaQuery.of(context).size.height/2.3),
            Padding(
              padding: EdgeInsets.only(
                top: 50,
                bottom: 20,
                left: 40,
                right: 40,
              ),
              child: buttonBuilder(() =>navigate(context, BoughtTable(restnt: widget.restnt)), "KEYINGISI", AppColors.appColor, GoogleFonts.nunitoSans(fontWeight: FontWeight.bold), AppColors.appColor),
            )
          ],
        ),
      ),
    );
  }
  String _district = "Andijon";

  updateAppBar(){
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
                              textStyle: GoogleFonts.nunitoSans(color: Colors.grey),
                              value: "Andijon",
                              child: Text("Andijon",style: GoogleFonts.nunitoSans(),)),
                          PopupMenuItem(
                              textStyle: GoogleFonts.nunitoSans(color: Colors.grey),
                              value: "Toshkent",
                              child: Text("Toshkent",style: GoogleFonts.nunitoSans(),)),
                          PopupMenuItem(
                              textStyle: GoogleFonts.nunitoSans(color: Colors.grey),
                              value: "Farg'ona",
                              child: Text("Farg'ona",style: GoogleFonts.nunitoSans(),)),
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
