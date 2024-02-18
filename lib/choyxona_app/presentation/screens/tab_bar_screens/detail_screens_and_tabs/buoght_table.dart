import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:untitled2/choyxona_app/constant/app_colors.dart';
import 'package:untitled2/choyxona_app/presentation/screens/tab_bar_screens/detail_screens_and_tabs/congrast_bought_table.dart';
import 'package:untitled2/choyxona_app/presentation/widgets/app_button.dart';
import 'package:untitled2/choyxona_app/presentation/widgets/navigators.dart';

import '../../../../exe_model/rest.dart';
import '../../bottom_screens/borrom_search_page.dart';
import '../../bottom_screens/home_page.dart';
import '../../bottom_screens/location_page.dart';
import '../../bottom_screens/profile_page.dart';

class BoughtTable extends StatefulWidget {
  const BoughtTable({super.key, required this.restnt});

  final Restnt restnt;

  @override
  State<BoughtTable> createState() => _BoughtTableState();
}

class _BoughtTableState extends State<BoughtTable> {
  int _selectedIndex = 0;

  final _gap = Gap(10);

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
      body: _selectedIndex == 0 ? _boughtTable() : _screens[_selectedIndex],
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
                      child: Icon(CupertinoIcons.home,color: _selectedIndex == 0 ? Colors.white : Colors.grey),
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    backgroundColor: Colors.black,
                    icon: Icon(CupertinoIcons.location_solid,color: _selectedIndex == 1 ? Colors.white : Colors.grey),
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

  _boughtTable() {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Gap(60),
          updateAppBar(),
          const Gap(20),
          Text("${widget.restnt.name} Joy band qilish",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
          const Gap(60),
          _getRestTable()
        ],
      ),
    );
  }

  _getRestTable() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _rowBuilder("Restaurant", widget.restnt.name ?? ""),
        _gap,
        Divider(color: Colors.grey.shade400),
        _gap,
        _rowBuilder("Kun", "2-Yanvar 2023"),
        _gap,
        Divider(color: Colors.grey.shade400),
        _gap,
        _rowBuilder("Soat", "07:00 PM"),
        _gap,
        Divider(color: Colors.grey.shade400),
        _gap,
        _rowBuilder("Mehmonlar Soni","4" ),
        _gap,
        Divider(color: Colors.grey.shade400),
        _gap,
        _rowBuilder("Stol Raqami","3" ),
        _gap,
        Padding(padding: EdgeInsets.only(
          top: 100,
          bottom: 60,
          right: 40,
          left: 40,
        ),
        child: buttonBuilder(() =>navigatePushRemove(context, CongratsPlace(restnt: widget.restnt)), "TASDIQLASH", AppColors.appColor, TextStyle(fontWeight: FontWeight.bold), AppColors.appColor),
        )
      ],
    );
  }

  _rowBuilder(String restName, String restData) {
    return Padding(
      padding: const EdgeInsets.only(right: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(restName, style: TextStyle(fontWeight: FontWeight.bold)),
          Text(restData, style: TextStyle(fontWeight: FontWeight.bold))
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
                              textStyle: TextStyle(color: Colors.grey),
                              value: "Andijon",
                              child: Text("Andijon")),
                          PopupMenuItem(
                              textStyle: TextStyle(color: Colors.grey),
                              value: "Toshkent",
                              child: Text("Toshkent")),
                          PopupMenuItem(
                              textStyle: TextStyle(color: Colors.grey),
                              value: "Farg'ona",
                              child: Text("Farg'ona")),
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
                            style: TextStyle(color: Colors.grey),
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
