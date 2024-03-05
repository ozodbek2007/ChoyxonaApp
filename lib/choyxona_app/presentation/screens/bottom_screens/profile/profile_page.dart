import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled2/choyxona_app/constant/app_colors.dart';
import 'package:untitled2/choyxona_app/presentation/screens/bottom_screens/profile/edit_profile.dart';
import 'package:untitled2/choyxona_app/presentation/screens/single_screens/welcome_page.dart';
import 'package:untitled2/choyxona_app/presentation/widgets/navigators.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _LocationPageState();
}

class _LocationPageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: _getTheUserProfile(),
    );
  }

  _getTheUserProfile() {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Gap(80),
          _getHeader(),
          const Gap(40),
          _getUserInfo(),
          const Gap(40),
          _logOutSection()
        ],
      ),
    );
  }

  _getHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: SizedBox(
        width: double.infinity,
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(1000000),
                color: Color(0xff57fdbc),
              ),
              child: null,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("User Name Surname",
                    style: GoogleFonts.nunitoSans(
                        fontWeight: FontWeight.bold, fontSize: 20)),
                Text('User bio clearly',
                    style: GoogleFonts.nunitoSans(color: Colors.grey)),
                InkWell(
                  onTap: () => navigate(context, EditProfile()),
                  child: Text("EDIT",
                      style: GoogleFonts.nunitoSans(
                          color: AppColors.appColor,
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.appColor)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  _getUserInfo() {
    return Container(
      height: 250,
      width: double.infinity,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade400,
              spreadRadius: 0.5,
              blurRadius: 0.5,
            )
          ],
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade400),
          borderRadius: BorderRadius.circular(20)),
      child: SingleChildScrollView(
        padding: EdgeInsets.only(top: 15, left: 10, right: 10),
        child: Column(
          children: [
            ListTile(
              leading: Icon(CupertinoIcons.person, color: AppColors.appColor),
              title: Text("  TO'LIQ ISM",
                  style: GoogleFonts.nunitoSans(
                      fontSize: 15, fontWeight: FontWeight.bold)),
              subtitle: Text("  User Name Surname",
                  style: GoogleFonts.nunitoSans(color: Colors.grey)),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.phone, color: Color(0xff369afd)),
              title: Text("  TELEFON RAQAMI",
                  style: GoogleFonts.nunitoSans(
                      fontSize: 15, fontWeight: FontWeight.bold)),
              subtitle: Text("  91-911-99-91",
                  style: GoogleFonts.nunitoSans(color: Colors.grey)),
            ),
            ListTile(
              leading: Icon(Icons.email_outlined, color: Colors.indigoAccent),
              title: Text("  BIO",
                  style: GoogleFonts.nunitoSans(
                      fontSize: 15, fontWeight: FontWeight.bold)),
              subtitle: Text("  User info clearly",
                  style: GoogleFonts.nunitoSans(color: Colors.grey)),
            ),
          ],
        ),
      ),
    );
  }

  _logOutSection() {
    return Container(
      height: 80,
      width: double.infinity,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade400,
              spreadRadius: 0.5,
              blurRadius: 0.5,
            )
          ],
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade400),
          borderRadius: BorderRadius.circular(20)),
      child: Center(
        child: ListTile(
          onTap: () => navigate(context, WelcomePage()),
          leading: Icon(Icons.exit_to_app, color: Colors.red),
          titleAlignment: ListTileTitleAlignment.center,
          title: Text("   Log Out",
              style: GoogleFonts.nunitoSans(fontWeight: FontWeight.bold)),
          trailing: Icon(
            CupertinoIcons.forward,
            color: Colors.grey.shade400,
          ),
        ),
      ),
    );
  }
}
