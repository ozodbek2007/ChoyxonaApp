import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/choyxona_app/constant/leading_icon.dart';
import 'package:untitled2/choyxona_app/presentation/screens/bottom_screens/borrom_search_page.dart';
import 'package:untitled2/choyxona_app/presentation/screens/bottom_screens/home_page.dart';
import 'package:untitled2/choyxona_app/presentation/screens/bottom_screens/location_rent/location_page.dart';
import 'package:untitled2/choyxona_app/presentation/screens/bottom_screens/profile/profile_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});


  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List _screens = [
    HomePage(),
    LocationPage(),
    BottomSearchScreen(),
    ProfilePage()
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainTheme(context),
      body: _screens[_selectedIndex],
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
}
