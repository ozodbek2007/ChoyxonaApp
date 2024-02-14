import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:untitled2/choyxona_app/constant/app_colors.dart';
import 'package:untitled2/choyxona_app/constant/leading_icon.dart';
import 'package:untitled2/choyxona_app/constant/text_styles.dart';
import 'package:untitled2/choyxona_app/presentation/screens/sign_screens/sms_page.dart';
import 'package:untitled2/choyxona_app/presentation/widgets/app_button.dart';
import 'package:untitled2/choyxona_app/presentation/widgets/navigators.dart';

class NumberConfirmScreen extends StatefulWidget {
  const NumberConfirmScreen({super.key});

  @override
  State<NumberConfirmScreen> createState() => _NumberConfirmScreenState();
}

class _NumberConfirmScreenState extends State<NumberConfirmScreen> {
  TextEditingController _number = TextEditingController();

  var maskFormatter = new MaskTextInputFormatter(
      mask: '##-###-##-##',
      type: MaskAutoCompletionType.lazy
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _confirmNumberSection(),
    );
  }

  _confirmNumberSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Gap(60),
            leadingIcon(context),
            const Gap(40),
            Text("Log in", style: TextStyles.titleTextStyle),
            const Gap(10),
            Text(
                "Iltimos mamlaktingizni tasdiqlang va telefon raqamingizin kiriting",
                style: TextStyles.descTextStyle),
            const Gap(60),
            Divider(),
            InkWell(
              onTap: ()=>_showCountryDialog(),
              child: Ink(
                child: _countryBuilder("Uzbekistan", "assets/country_image/uzbekistan.png"),
              ),
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("+998"),
                const Gap(10),
                Container(height: 30,width: 1,color: Colors.grey,child: null),
                const Gap(10),
                SizedBox(
                  width: 300,
                  height: 50,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      maskFormatter
                    ],
                    controller: _number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "00 000-00-00",
                      hintStyle: TextStyles.descTextStyle,
                    ),
                  ),
                ),
              ],
            ),
            Divider(),
            const Gap(50),
            buttonBuilder(()=>navigate(context, SMSPage()), "Davom Etish", AppColors.appColor, TextStyle(color: Colors.white,fontWeight: FontWeight.bold), AppColors.appColor)
          ],
        ),
      ),
    );
  }

  _showCountryDialog() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _countryBuilder(
                      "Uzbekistan", "assets/country_image/uzbekistan.png"),
                  Divider(),
                  _countryBuilder("Russia", "assets/country_image/russia.png"),
                  Divider(),
                  _countryBuilder("Japan", "assets/country_image/japan.png"),
                  Divider(),
                  _countryBuilder("USA", "assets/country_image/usa.png"),
                  Divider(),
                ],
              ),
              actions: [
                TextButton(
                    onPressed: () => navigatePop(context), child: Text("OK"))
              ],
            ));
  }

  _countryBuilder(String countryName, String imageName) {
    return SizedBox(
      width: 140,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Gap(20),
          SizedBox(
              height: 25,
              width: 30,
              child: Image.asset(imageName, fit: BoxFit.cover)),
          const Gap(10),
          Text(countryName)
        ],
      ),
    );
  }
}
