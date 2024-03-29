import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled2/choyxona_app/exe_model/rest.dart';
import 'package:untitled2/choyxona_app/presentation/widgets/navigators.dart';

import 'detailed_meal.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  TextStyle boldStyle = GoogleFonts.nunitoSans(fontWeight: FontWeight.bold,fontSize: 13);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _getAllRecipe());
  }

  _getAllRecipe() {
    var rest = restntList[1];
    return Column(
      children: [
        SizedBox(
          height: 550,
          width: double.infinity,
          child: ListView.builder(
            itemCount: 12,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Container(
                  height: 120,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.grey.shade400)),
                  child: InkWell(
                    onTap: ()=>navigate(context, MealDetailedPage(restnt:rest)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 90,
                          width: 160,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset("assets/exe_restuarnt/img.png",fit: BoxFit.cover,)),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("USDA Beef Ribs Finger", style: boldStyle),
                            _descRecipe("Asal sousi", Color(0xffc78f55)),
                            _descRecipe("Obatan sousi", Color(0xff9f4e3f)),
                            Text("389.000 VND", style: boldStyle),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        const Gap(10),
        InkWell(
          onTap: (){},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Hammasi",style: GoogleFonts.nunitoSans(color:Color(0xff0084fd))),
              Icon(CupertinoIcons.forward,size: 20,color: Color(0xff0084fd),)
            ],
          ),
        )
      ],
    );
  }

  _descRecipe(String title, Color color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 10,
          width: 10,
          decoration: BoxDecoration(
              color: color,
              // color: Color(0xffc78f55),
              borderRadius: BorderRadius.circular(10)),
          child: null,
        ),
        Text("  ${title}", style: GoogleFonts.nunitoSans(fontSize: 10,color: color))
      ],
    );
  }
}
