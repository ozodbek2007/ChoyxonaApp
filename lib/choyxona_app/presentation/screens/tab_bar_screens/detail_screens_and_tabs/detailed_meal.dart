import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled2/choyxona_app/exe_model/rest.dart';
import 'package:untitled2/choyxona_app/presentation/widgets/navigators.dart';
import '../../../../constant/app_colors.dart';
import '../../bottom_screens/borrom_search_page.dart';
import '../../bottom_screens/home_page.dart';
import '../../bottom_screens/location_rent/location_page.dart';
import '../../bottom_screens/profile/profile_page.dart';

class MealDetailedPage extends StatefulWidget {
  const MealDetailedPage({super.key, required this.restnt});

  final Restnt restnt;

  @override
  State<MealDetailedPage> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<MealDetailedPage> {
  final List _screens = [
    HomePage(),
    LocationPage(),
    BottomSearchScreen(),
    ProfilePage()
  ];

  int _selectedIndex = 0;

  TextEditingController _controller = TextEditingController();

  var _googleFont =
      GoogleFonts.nunitoSans(fontWeight: FontWeight.bold, fontSize: 20);

  TextStyle greyTextStyle = GoogleFonts.nunitoSans(color: Colors.grey);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                const Gap(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      widget.restnt.name ?? "",
                      style: GoogleFonts.nunitoSans(fontSize: 24),
                    ),
                    Text("\$10",
                        style: GoogleFonts.nunitoSans(
                            fontWeight: FontWeight.bold, fontSize: 20))
                  ],
                ),
                const Gap(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(CupertinoIcons.bolt_circle, color: Colors.red),
                    const Gap(5),
                    Text(
                      widget.restnt.name ?? "",
                      style: GoogleFonts.nunitoSans(
                          color: Colors.grey, fontSize: 15),
                    ),
                  ],
                ),
                const Gap(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(CupertinoIcons.star_fill, color: AppColors.appColor),
                    Text("  ${widget.restnt.rating}k",
                        style: GoogleFonts.nunitoSans(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                  ],
                ),
                const Gap(10),
                Text(widget.restnt.desc ?? "",
                    style: GoogleFonts.nunitoSans(
                        fontSize: 12, color: Colors.grey)),
                const Gap(10),
                _restFacilities()
              ],
            ),
          ),
        ],
      ),
    );
  }

  _restFacilities() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "INGREDIENTLAR",
            style: GoogleFonts.nunitoSans(color: Colors.black),
          ),
          const Gap(10),
          SizedBox(
            height: 190,
            width: double.infinity,
            child: GridView.builder(
              itemCount: 9,
              scrollDirection: Axis.horizontal,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {},
                  child: SizedBox(
                    height: 60,
                    width: 50,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              color: Color(0xffd3fded),
                              borderRadius: BorderRadius.circular(35),
                              image: DecorationImage(
                                  image: AssetImage("assets/img/google.png"))),
                          child: null,
                        ),
                        Text(
                          "xullas...",
                          style: greyTextStyle,
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          _commentSection()
        ],
      ),
    );
  }

  _commentSection() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Gap(25),
        Text("Fikrlaringizni baham ko'ring", style: _googleFont),
        const Gap(25),
        Text("SIZGA QANCHALIK YOQDI?",
            style: GoogleFonts.nunitoSans(color: Colors.grey)),
        const Gap(15),
        _starSection(),
        const Gap(20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade400, spreadRadius: 3, blurRadius: 3)
            ]),
            height: 250,
            width: double.infinity,
            child: TextField(
              maxLines: 10,
              cursorColor: Colors.grey,
              cursorHeight: 25,
              controller: _controller,
              decoration: InputDecoration(
                suffixIconColor: Colors.grey,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    width: 1,
                    color: Colors.grey.shade300,
                  ),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    width: 1,
                    color: Colors.grey,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    width: 1,
                    color: Colors.grey,
                  ),
                ),
                fillColor: Colors.white,
                filled: true,
                hintText: "Biror narsa yozing",
                hintStyle:
                    GoogleFonts.nunitoSans(fontSize: 16, color: Colors.grey),
              ),
            ),
          ),
        )
      ],
    );
  }

  _starSection() {
    return SizedBox(
      height: 70,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 7, vertical: 5),
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(45)),
                child: Center(
                  child: Icon(
                    Icons.star,
                    color: AppColors.appColor,
                    size: 20,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
