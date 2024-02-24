import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled2/choyxona_app/constant/app_colors.dart';
import 'package:untitled2/choyxona_app/constant/leading_icon.dart';

import '../../../../exe_model/rest.dart';
import '../../../widgets/navigators.dart';
import '../../tab_bar_screens/detail_screens_and_tabs/detail_screen.dart';
import '../../tab_bar_screens/detail_screens_and_tabs/detailed_meal.dart';
import '../home_page.dart';
import '../location_rent/location_page.dart';
import '../profile/profile_page.dart';
import 'borrom_search_page.dart';

class DetailedKeyWord extends StatefulWidget {
  DetailedKeyWord({super.key, required this.keyWord});

  final keyWord;

  @override
  State<DetailedKeyWord> createState() => _DetailedKeyWordState();
}

class _DetailedKeyWordState extends State<DetailedKeyWord> {
 final TextStyle boldStyle = GoogleFonts.nunitoSans(fontWeight: FontWeight.bold,fontSize: 13);

  final List _screens = [
    HomePage(),
    LocationPage(),
    BottomSearchScreen(),
    ProfilePage()
  ];

  int _selectedIndex = 0;

  @override
  void initState() {
    _selectedIndex = 2;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainTheme(context),
      body: _selectedIndex == 2 ? _keyWordSection(context) :_screens[_selectedIndex],
      bottomNavigationBar:Padding(
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
      ) ,
    );
  }

  _keyWordSection(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Gap(65),
          _appBar(context),
          Text("Mashxur Burgerlar",style: GoogleFonts.nunitoSans(fontSize: 25)),
          _getAllRecipe(),
          Text("Mashxur Restaurantlar",style: GoogleFonts.nunitoSans(fontSize: 25)),
          _restaurantBuilder()
        ],
      ),
    );
  }

  _appBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [leadingIconGrey(context),
            const Gap(10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 7),
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Color(0xfff4f4f4),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("${widget.keyWord}",
                      style: GoogleFonts.nunitoSans(fontWeight: FontWeight.bold)),
                  Icon(CupertinoIcons.arrowtriangle_down_fill,
                      size: 20, color: AppColors.appColor)
                ],
              ),
            ),],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(CupertinoIcons.search_circle_fill,
                  color: Colors.black, size: 45),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.vertical_split_outlined,
                  color: Colors.black, size: 35),
              onPressed: () {},
              color: Color(0xffeaeef2),
            )
          ],
        )
      ],
    );
  }

  _getAllRecipe() {
    var rest = restntList[1];
    return SizedBox(
      height: 300,
      width: double.infinity,
      child: ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: ()=>navigate(context, MealDetailedPage(restnt:rest)),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Container(
                height: 120,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                    borderRadius: BorderRadius.circular(15),),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 90,
                      width: 160,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset("assets/exe_restuarnt/img.png",fit: BoxFit.cover,)),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("USDA Beef Ribs Finger", style: boldStyle),
                        _descRecipe("Asal sousi", Color(0xffc78f55)),
                        _descRecipe("Obatan sousi", Color(0xff9f4e3f)),
                        Text("119.000 VND", style: boldStyle),
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

  _descRecipe(String title, Color color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 10,
          width: 10,
          decoration: BoxDecoration(
              color: color,
              // color: Color(0xffc78f55),
              borderRadius: BorderRadius.circular(10)),
          child: null,
        ),
        Text("  ${title}", style: GoogleFonts.nunitoSans(fontSize: 10,color: color))
      ],
    );
  }

 _restaurantBuilder(){
   return SizedBox(
     height: 600,width: double.infinity,
     child: ListView.builder(
       itemCount: restntList.length,
       itemBuilder: (context, index){
         final data = restntList[index];
         return InkWell(
           onTap:()=>navigate(context, DetailScreen(restnt: data)),
           child: Padding(
             padding: const EdgeInsets.only(bottom: 10,left: 10,right: 10),
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
     ),
   );
 }

}
