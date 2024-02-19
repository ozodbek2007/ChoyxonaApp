import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:untitled2/choyxona_app/constant/leading_icon.dart';
import 'check_sms.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  var maskFormatter = new MaskTextInputFormatter(
      mask: '##-###-##-##', type: MaskAutoCompletionType.lazy);

  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(25),
            leadingIcon(context),
            const Gap(30),
            Align(
                alignment: Alignment.center,
                child: Text(
                  "Parolni unutdingizmi?",
                  style: GoogleFonts.nunitoSans(fontWeight: FontWeight.bold, fontSize: 35),
                )),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: 346,
                height: 40,
                child: Text(
                    "Xavotir olmang! Bo'lib turadi. Hisobingiz bilan bog'langan telefon raqamingizni kiriting.",style: GoogleFonts.nunitoSans(),),
              ),
            ),
            Gap(30),
            Align(
              alignment: Alignment.topLeft,
              child: SizedBox(
                width: 98,
                height: 18,
                child: Text(
                  "Telefon raqami",
                  style: GoogleFonts.nunitoSans(
                    fontSize: 14,
                    color: Color(0xff000000),
                  ),
                ),
              ),
            ),
            Gap(6),
            TextField(
              inputFormatters: [maskFormatter],
              controller: _textController,
              keyboardType: TextInputType.number,
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
                hintText: "Telefon raqmingizni kiriting",
                hintStyle: GoogleFonts.nunitoSans(color: Colors.grey.shade500),
              ),
            ),
            const Gap(50),
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
                onPressed: () {
                  Navigator.of(context).push(CupertinoPageRoute(
                      builder: (context) => const CheckSms()));
                },
                child:  Text(
                  "Kodni yuboring",
                  style: GoogleFonts.nunitoSans(
                      color: Color(0xffffffff),
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ),
            ),
            const Gap(300),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Parol esingizdami?"),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child:  Text(
                      "Tizimga kirish",
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
