import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:untitled2/choyxona_app/constant/leading_icon.dart';
import 'package:untitled2/choyxona_app/presentation/screens/main_page.dart';
import 'package:untitled2/choyxona_app/presentation/screens/single_screens/welcome_page.dart';
import 'package:untitled2/choyxona_app/presentation/widgets/navigators.dart';

import '../sign_up_screens/register_page.dart';
import 'forgot_password.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _phoneController = TextEditingController();

  final _passwordController = TextEditingController();

  bool _isVisable = false;

  bool _isOpen = false;

  var maskFormatter = new MaskTextInputFormatter(
      mask: "##-###-##-##", type: MaskAutoCompletionType.lazy);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            const Gap(60),
          InkWell(
              onTap: () => navigate(context,WelcomePage()),
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black)),
                child: Center(child: Icon(Icons.arrow_back_ios,size: 20,)),
              )),
            const Gap(20),
             Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Log in",
                style: GoogleFonts.nunitoSans(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            const Gap(25),
             Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Phone Number",
                  style: GoogleFonts.nunitoSans(fontSize: 14, color: Color(0xff000000)),
                )),
            const Gap(5),
            TextField(
              inputFormatters: [maskFormatter],
              keyboardType: TextInputType.number,
              controller: _phoneController,
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
                hintText: "+998  ",
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _isVisable = !_isVisable;
                    });
                  },
                  icon: Icon(
                      _isVisable ? Icons.check_circle : Icons.circle_outlined),
                ),
              ),
            ),
            const Gap(18),
             Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Password",
                  style: GoogleFonts.nunitoSans(fontSize: 14, color: Color(0xff000000)),
                )),
            const Gap(5),
            TextField(
              obscureText:!_isOpen,
              // obscuringCharacter: "*",
              controller: _passwordController,
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
                hintText: "Enter your password",
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _isOpen = !_isOpen;
                    });
                  },
                  icon: Icon(_isOpen
                      ? Icons.remove_red_eye_outlined
                      : Icons.visibility_off_outlined),
                ),
              ),
            ),
            const Gap(10),
            Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(CupertinoPageRoute(
                        builder: (context) => const ForgotPassword()));
                  },
                  child:  Text(
                    "Forgot password?",
                    style: GoogleFonts.nunitoSans(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                )),
            const Gap(35),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: const Color(0xff0bff99),
                ),
                onPressed: () => navigatePushRemove(context, MainPage()),
                child:  Text(
                  "Tizimga kirish",
                  style: GoogleFonts.nunitoSans(
                      color: Color(0xffffffff),
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ),
            ),
            const Gap(30),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 1,
                  width: MediaQuery.of(context).size.width /4,
                  color: Color(0xffD8DADC),
                ),
                SizedBox(
                  width: 104,
                  height: 18,
                  child: Text("Yoki bilan kiring",style: GoogleFonts.nunitoSans(),),
                ),
                Container(
                  height: 1,
                  width: MediaQuery.of(context).size.width /4,
                  color: Color(0xffD8DADC),
                ),

              ],
            ),
            const Gap(30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Gap(8),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 60,
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.grey.shade400,
                        ),
                        color: Colors.white),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset("assets/img/facebook.png",
                            width: 50, height: 50),
                      ],
                    ),
                  ),
                ),
                const Gap(22),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 60,
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.grey.shade400,
                        ),
                        color: Colors.white),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset("assets/img/google.png",
                            width: 50, height: 50),
                      ],
                    ),
                  ),
                ),
                const Gap(22),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 60,
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.grey.shade400,
                        ),
                        color: Colors.white),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset("assets/img/apple_logo.png",
                            width: 30, height: 30),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const Gap(50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Text("Don't have an account?",style: GoogleFonts.nunitoSans(),),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).push(CupertinoPageRoute(
                          builder: (context) => RegisterPage()));
                    },
                    child:  Text(
                      "Sign up",
                      style: GoogleFonts.nunitoSans(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
