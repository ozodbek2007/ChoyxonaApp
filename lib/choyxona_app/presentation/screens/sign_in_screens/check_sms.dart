import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:untitled2/choyxona_app/constant/leading_icon.dart';
import 'package:untitled2/choyxona_app/presentation/screens/sign_in_screens/return_password.dart';
import 'package:untitled2/choyxona_app/presentation/widgets/navigators.dart';

class CheckSms extends StatefulWidget {
  const CheckSms({super.key});

  @override
  State<CheckSms> createState() => _CheckSmsState();
}

class _CheckSmsState extends State<CheckSms> {
  TextEditingController _first = TextEditingController();
  TextEditingController _second = TextEditingController();
  TextEditingController _third = TextEditingController();
  TextEditingController _fourth = TextEditingController();
  TextEditingController _five = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: _smsSection(),
    );
  }

  _smsSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(80),
            leadingIcon(context),
            const Gap(20),
            Center(
                child: Text(
              "Iltimos,SMS ni tekshiring",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
            )),
            const Gap(10),
            Row(
              children: [
                Text(
                  "+998 93 *** *** 54",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
                Gap(5),
                Text("Biz kod yubordik")
              ],
            ),
            const Gap(35),
            _textFiledSection(),
            const Gap(15),
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
                onPressed: () =>navigatePushRemove(context, ReturnPassword()),
                child: const Text(
                  "Tasdiqlash",
                  style: TextStyle(
                      color: Color(0xffffffff),
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ),
            ),
            const Gap(100),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "Kodni qayta yuboring",
                      style: TextStyle(color: Colors.black),
                    )),
                Text(
                  "00:20",
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  _textFiledSection() {
    return SizedBox(
      width: double.infinity,
      height: 120,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _enterNumberSection(_first),
          _enterNumberSection(_second),
          _enterNumberSection(_third),
          _enterNumberSection(_fourth),
        ],
      ),
    );
  }

  _enterNumberSection(TextEditingController controller) {
    return SizedBox(
      height: 120,
      width: 60,
      child: TextField(
        maxLength: 1,
        keyboardType: TextInputType.number,
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: Colors.grey)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: Colors.black)),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: Colors.black)),
        ),
      ),
    );
  }
}
