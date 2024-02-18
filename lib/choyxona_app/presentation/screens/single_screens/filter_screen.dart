import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../constant/app_colors.dart';
import '../../../constant/text_styles.dart';
import '../../widgets/app_button.dart';
import '../../widgets/navigators.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 150),
        child: Container(
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(15)),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Qidiruvingizni filtrlang",
                        style: TextStyle(fontSize: 18)),
                    InkWell(
                      onTap: () => navigatePop(context),
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.black12),
                        child:
                            Center(child: Icon(CupertinoIcons.xmark, size: 15)),
                      ),
                    )
                  ],
                ),
                Text("TAKLIFLAR", style: TextStyles.descTextStyle),
                _sugestionSection(),
                const Gap(10),
                Text("NARXLAR", style: TextStyles.descTextStyle),
                const Gap(10),
                _costSection(),
                const Gap(20),
                Text("REYTING", style: TextStyles.descTextStyle),
                _starSection(),
                const Gap(20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: buttonBuilder(
                      () => navigatePop(context),
                      "FILTER",
                      AppColors.appColor,
                      TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                      AppColors.appColor),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _starSection() {
    return SizedBox(
      height: 60,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 7, vertical: 5),
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(45)),
                child: Center(
                  child: Icon(
                    Icons.star,
                    color: AppColors.appColor,
                    size: 20,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  _costSection() {
    return SizedBox(
      height: 60,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) {
          var numix = index + 1;
          return InkWell(
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4, vertical: 5),
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(35)),
                child: Center(child: Text("${'\$' * numix}")),
              ),
            ),
          );
        },
      ),
    );
  }

  List _sugest = [
    "Alkagol",
    "Jonli music",
    "Offer",
    "Raqs",
  ];

  _sugestionSection() {
    return SizedBox(
      height: 160,
      width: MediaQuery.of(context).size.width,
      child: GridView.builder(
          itemCount: _sugest.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, mainAxisSpacing: 2, childAspectRatio: 2 / 0.8),
          itemBuilder: (context, index) {
            final data = _sugest[index];
            return InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.grey.shade400)),
                  child: Center(
                    child: Text(data,style: TextStyle(color: Colors.grey.shade800,fontSize: 15)),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
