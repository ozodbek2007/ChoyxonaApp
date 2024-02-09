import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:untitled2/choyxona_app/constant/app_colors.dart';
import 'package:untitled2/choyxona_app/constant/leading_icon.dart';
import 'package:untitled2/choyxona_app/constant/text_styles.dart';
import 'package:untitled2/choyxona_app/presentation/screens/sign_screens/success_page.dart';
import 'package:untitled2/choyxona_app/presentation/widgets/app_button.dart';
import 'package:untitled2/choyxona_app/presentation/widgets/navigators.dart';

class SMSPage extends StatefulWidget {
  const SMSPage({super.key});

  @override
  State<SMSPage> createState() => _SMSPageState();
}

class _SMSPageState extends State<SMSPage> {



  TextEditingController _first = TextEditingController();
  TextEditingController _second = TextEditingController();
  TextEditingController _third = TextEditingController();
  TextEditingController _fourth = TextEditingController();
  TextEditingController _five = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            const Gap(60),
            leadingIcon(context),
            const Gap(60),
            Center(child: Text("Telefon Raqamingizni      Tasdiqlang", style: TextStyles.titleTextStyle)),
            const Gap(10),
            Text(
                "Telefoningizga faollashtirish kodi bilan SMS yubordik +998 97 977 97 77"),
            const Gap(15),
            _textFiledSection(),
            const Gap(100),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Kodni qayta yuboring   ",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                Text("00:20", style: TextStyles.descTextStyle)
              ],
            ),
            const Gap(25),
            buttonBuilder(() =>navigatePushRemove(context, SuccessPage()), "Tasdiqlash", AppColors.appColor, TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 15), AppColors.appColor)
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
          _enterNumberSection(_five),
        ],
      ),
    );
  }

  _enterNumberSection(
      TextEditingController controller ){
    return SizedBox(
      height: 120,
      width: 60,
      child: TextField(
        keyboardType: TextInputType.number,
        maxLength: 1,
        controller: controller,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: Colors.grey
            )
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                  color: Colors.black
              )
          ),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                  color: Colors.black
              )
          ),
        ),
      ),
    );
  }
}
