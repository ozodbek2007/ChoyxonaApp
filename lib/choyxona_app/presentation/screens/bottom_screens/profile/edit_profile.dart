import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:untitled2/choyxona_app/constant/app_colors.dart';
import 'package:untitled2/choyxona_app/constant/leading_icon.dart';
import 'package:untitled2/choyxona_app/presentation/screens/bottom_screens/profile/profile_page.dart';
import 'package:untitled2/choyxona_app/presentation/widgets/app_button.dart';
import 'package:untitled2/choyxona_app/presentation/widgets/app_text_field.dart';
import 'package:untitled2/choyxona_app/presentation/widgets/navigators.dart';

import '../borrom_search_page.dart';
import '../home_page.dart';
import '../location_rent/location_page.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  int _selectedIndex = 0;

  @override
  void initState() {
    _selectedIndex = 3;
    super.initState();
  }

  final List _screens = [
    HomePage(),
    LocationPage(),
    BottomSearchScreen(),
    ProfilePage()
  ];

  TextEditingController _name = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _bio = TextEditingController();

  var maskFormatter = MaskTextInputFormatter(mask: "##-###-##-##");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: _selectedIndex == 3
          ? _editProfileSection()
          : _screens[_selectedIndex],
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
    );
  }

  _editProfileSection() {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Gap(80),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _leadingIcon(),
              Text("    Edit profile",
                  style: GoogleFonts.nunitoSans(
                      fontWeight: FontWeight.bold, fontSize: 18)),
            ],
          ),
          const Gap(20),
          Center(child: _imageSection()),
          _editingSection(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: buttonBuilder(
                () {},
                "SAQLASH",
                AppColors.appColor,
                GoogleFonts.nunitoSans(
                    fontWeight: FontWeight.bold, color: Colors.white),
                AppColors.appColor),
          )
        ],
      ),
    );
  }

  _leadingIcon() {
    return InkWell(
      onTap: () => navigatePop(context),
      child: Container(
        height: 45,
        width: 45,
        decoration: BoxDecoration(
            color: Color(0xffeaeef2),
            borderRadius: BorderRadius.circular(10000)),
        child: Center(
          child: Icon(CupertinoIcons.back),
        ),
      ),
    );
  }

  _imageSection() {
    return InkWell(
      onTap: () {},
      child: Stack(children: [
        Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(
              color: Color(0xffd3fded),
              borderRadius: BorderRadius.circular(10000)),
        ),
        Positioned(
            right: 0,
            bottom: 0,
            child: Center(
                child: Icon(CupertinoIcons.pencil_circle_fill,
                    size: 45, color: AppColors.appColor)))
      ]),
    );
  }

  _editingSection() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("TO'LIQ ISM",
            style: GoogleFonts.nunitoSans(
                fontWeight: FontWeight.bold, fontSize: 13)),
        const Gap(10),
        AppTextField("VIshak eshak", false, _name,
            IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.person)),1),
        const Gap(23),
        Text("TELEFON RAQAMI",
            style: GoogleFonts.nunitoSans(
                fontWeight: FontWeight.bold, fontSize: 13)),
        const Gap(10),
        _textField(),
        const Gap(23),
        Text("BIO",
            style: GoogleFonts.nunitoSans(
                fontWeight: FontWeight.bold, fontSize: 13)),
        const Gap(10),
        AppTextField(
            "I Love FastFood",
            false,
            _bio,
            IconButton(
                onPressed: () {},
                icon: Icon(CupertinoIcons.pen)),
        5
        )
      ],
    );
  }

  _textField() {
    return TextField(
      cursorColor: Colors.grey,
      cursorHeight: 25,
      inputFormatters: [maskFormatter],
      keyboardType: TextInputType.number,
      controller: _phone,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
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
        hintText: "91-999-91-91",
        hintStyle: GoogleFonts.nunitoSans(fontSize: 16, color: Colors.grey),
        suffixIcon: IconButton(
          onPressed: () {},
          icon: Icon(
            CupertinoIcons.phone,
            color: Colors.grey.shade400,
          ),
        ),
      ),
    );
  }
}
