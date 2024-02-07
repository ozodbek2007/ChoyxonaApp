import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:untitled2/choyxona_app/constant/app_colors.dart';
import 'package:untitled2/choyxona_app/presentation/widgets/app_text_field.dart';
import 'package:untitled2/choyxona_app/presentation/widgets/navigators.dart';

import '../../../constant/leading_icon.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _name = TextEditingController();
  TextEditingController _password = TextEditingController();

  TextStyle _style = TextStyle(fontWeight: FontWeight.bold);

  bool _isVisible = true;

  bool _iconTapped = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: _registerSection(),
    );
  }

  _registerSection() {
    var _size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Gap(25),
              Align(
                alignment: Alignment.topLeft,
                child: leadingIcon(context),
              ),
              const Gap(60),
              Text("Salom, Xush Kelibsiz!👋",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
              const Gap(40),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "To'liq ismingiz",
                    style: _style,
                  ),
                  const Gap(5),
                  AppTextField(
                      "To'liq ismingiz",
                      false,
                      _name,
                      IconButton(
                          icon: Icon(
                            CupertinoIcons.person,
                            size: 20,
                          ),
                          onPressed: () {})),
                  const Gap(20),
                  Text(
                    "Parol",
                    style: _style,
                  ),
                  const Gap(5),
                  AppTextField(
                      "Parol",
                      _isVisible,
                      _password,
                      IconButton(
                        icon: Icon(
                          _isVisible
                              ? CupertinoIcons.eye
                              : CupertinoIcons.eye_slash,
                          size: 20,
                        ),
                        onPressed: () {
                          setState(() {
                            _isVisible = !_isVisible;
                          });
                        },
                      )),
                  // const Gap(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () {
                            setState(() {
                              _iconTapped = !_iconTapped;
                            });
                          },
                          icon: Icon(
                              _iconTapped
                                  ? CupertinoIcons.checkmark_alt_circle_fill
                                  : CupertinoIcons.check_mark_circled,
                              size: 25)),
                      Text("Eslab qolish", style: _style)
                    ],
                  )
                ],
              ),
              const Gap(40),
              SizedBox(
                height: 60,
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: AppColors.appColor,
                    ),
                    onPressed: () {},
                    child: Text("Ro'yhatdan O'tish",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold))),
              ),
              const Gap(80),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    color: Colors.grey,
                    height: 1,
                    width: _size.width / 3.3,
                    child: null,
                  ),
                  Text("    Yoki bilan    ",
                      style: TextStyle(color: Colors.grey)),
                  Container(
                    color: Colors.grey,
                    height: 1,
                    width: _size.width / 3.3,
                    child: null,
                  ),
                ],
              ),
              const Gap(30),
              _googleAndFaceBook(),
              const Gap(30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Hisobingiz bormi?  "),
                  InkWell(
                      onTap: () {},
                      child: Text("Tizmiga kiring", style: _style)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  _googleAndFaceBook() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: (){},
          child: Ink(
            child:
            _faceGoogleBuilder("assets/img/facebook.png", "Facebook"),
          ),
        ),
        InkWell(
          onTap: (){},
          child: Ink(
            child:
            _faceGoogleBuilder("assets/img/google.png", "Google"),
          ),
        )
      ],
    );
  }

  _faceGoogleBuilder(String imgPath, String companyName) {
    return Container(
      height: 60,
      width: 180,
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
          Image.asset(imgPath, width: 50, height: 50),
          Text(companyName, style: _style),
          const Gap(20)
        ],
      ),
    );
  }

}