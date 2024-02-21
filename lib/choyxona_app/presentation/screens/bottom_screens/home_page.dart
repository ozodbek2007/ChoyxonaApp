import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled2/choyxona_app/constant/app_colors.dart';
import 'package:untitled2/choyxona_app/constant/leading_icon.dart';
import 'package:untitled2/choyxona_app/constant/text_styles.dart';
import 'package:untitled2/choyxona_app/presentation/screens/single_screens/filter_screen.dart';
import 'package:untitled2/choyxona_app/presentation/screens/tab_bar_screens/all_choyxona.dart';
import 'package:untitled2/choyxona_app/presentation/screens/tab_bar_screens/all_data.dart';
import 'package:untitled2/choyxona_app/presentation/screens/tab_bar_screens/all_resturant.page.dart';

import 'package:untitled2/choyxona_app/presentation/widgets/app_button.dart';
import 'package:untitled2/choyxona_app/presentation/widgets/navigators.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Icon(CupertinoIcons.list_bullet_indent),
      ),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(230),
        child: _restaurantSection(),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [AllData(), AllRestaurant(), AllChoyxona()],
      ),
    );
  }

  _restaurantSection() {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
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
                                  child: Text("Andijon")),
                              PopupMenuItem(
                                  textStyle: GoogleFonts.nunitoSans(color: Colors.grey),
                                  value: "Toshkent",
                                  child: Text("Toshkent")),
                              PopupMenuItem(
                                  textStyle: GoogleFonts.nunitoSans(color: Colors.grey),
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
              const Gap(15),
              TextField(
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  prefixIcon: IconButton(
                    onPressed: () => navigate(context, FilterScreen()),
                    icon: Icon(CupertinoIcons.search, color: Colors.grey),
                  ),
                  hintText: "Restuarant qidiring",
                  hintStyle: GoogleFonts.nunitoSans(color: Colors.grey, fontSize: 13),
                  filled: true,
                  fillColor: Color(0xfff4f4f4),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Color(0xfff4f4f4)),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Color(0xfff4f4f4)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey.shade400),
                  ),
                ),
              ),
              const Gap(20),
              TabBar(
                  automaticIndicatorColorAdjustment: false,
                  dividerColor: Colors.white,
                  indicatorColor: Colors.white,
                  indicatorSize: TabBarIndicatorSize.tab,
                  splashBorderRadius: BorderRadius.circular(10000),
                  controller: _tabController,
                  tabs: [
                    Tab(
                      child:
                          _tabBarBuilder("🔥", "Hammasi", AppColors.appColor),
                    ),
                    Tab(
                      child: _tabBarBuilder(
                          "🔥", "Restaurant", AppColors.appColor),
                    ),
                    Tab(
                      child:
                          _tabBarBuilder("🔥", "Choyxona", AppColors.appColor),
                    ),
                  ])
            ],
          ),
        ),
      ),
    );
  }

  _tabBarBuilder(String imagePath, String title, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      height: 42,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 5,
          blurRadius: 7,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ], borderRadius: BorderRadius.circular(27), color: AppColors.appColor),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(imagePath, style: GoogleFonts.nunitoSans(fontSize: 20)),
          Text(title, style: GoogleFonts.nunitoSans(fontSize: 8))
        ],
      ),
    );
  }

  String _district = "Andijon";

  updateAppBar() {
    return SizedBox(
      height: 40,
      width: 100,
      child: Row(
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
                      height: 16,
                      width: 93,
                    ),
                    PopupMenuButton(
                      color: Colors.white,
                      itemBuilder: (BuildContext context) {
                        return <PopupMenuEntry<String>>[
                          PopupMenuItem(
                              textStyle: GoogleFonts.nunitoSans(color: Colors.grey),
                              value: "Andijon",
                              child: Text("Andijon")),
                          PopupMenuItem(
                              textStyle: GoogleFonts.nunitoSans(color: Colors.grey),
                              value: "Toshkent",
                              child: Text("Toshkent")),
                          PopupMenuItem(
                              textStyle: GoogleFonts.nunitoSans(color: Colors.grey),
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
          const Gap(15),
          TextField(
            cursorColor: Colors.black,
            decoration: InputDecoration(
              prefixIcon: Icon(
                CupertinoIcons.search,
                color: Colors.grey,
              ),
              hintText: "Restuarant qidiring",
              hintStyle: GoogleFonts.nunitoSans(color: Colors.grey, fontSize: 13),
              filled: true,
              fillColor: Color(0xfff4f4f4),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Color(0xfff4f4f4)),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Color(0xfff4f4f4)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey.shade400),
              ),
            ),
          ),
        ],
      ),
    );
  }


}
