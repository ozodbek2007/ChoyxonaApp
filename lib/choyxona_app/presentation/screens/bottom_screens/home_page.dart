import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Theme.of(context).primaryColor,
      body: _restaurantSection(),
    );
  }

  _restaurantSection() {
    return Center(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity,
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Color(0xffeaeef2)),
                    child: Center(
                        child: IconButton(
                          splashRadius: 50,
                            splashColor: Colors.red,
                            onPressed: () {},
                            icon: Icon(CupertinoIcons.list_bullet_indent))),
                  ),
                  const Gap(20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        "assets/img/choyxona_app1.png",
                        fit: BoxFit.cover,
                        height: 16,
                        width: 93,
                      ),
                      PopupMenuButton(
                        color: Colors.white,
                        itemBuilder: (BuildContext context) {
                          return <PopupMenuEntry<String>>[
                            PopupMenuItem(
                                textStyle: TextStyle(color: Colors.grey),
                                value: "Andijon",
                                child: Text("Andijon")),
                            PopupMenuItem(
                                textStyle: TextStyle(color: Colors.grey),
                                value: "Toshkent",
                                child: Text("Toshkent")),
                            PopupMenuItem(
                                textStyle: TextStyle(color: Colors.grey),
                                value: "Farg'ona",
                                child: Text("Farg'ona")),
                          ];
                        },
                        onSelected: (String value) {
                          Text("Country: $value");
                        },
                        child: Row(
                          children: [
                            Text(
                              "Andijan",
                              style: TextStyle(color: Colors.grey),
                            ),
                            Icon(
                              CupertinoIcons.arrowtriangle_down_fill,
                              size: 13,
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            const Gap(15),
            TextField(
              cursorColor: Colors.black,
              decoration: InputDecoration(
                prefixIcon: Icon(CupertinoIcons.search,color: Colors.grey,),
                hintText: "Restuarant qidiring",
                hintStyle: TextStyle(color: Colors.grey,fontSize: 13),
                filled: true,
                fillColor: Color(0xfff4f4f4),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Color(0xfff4f4f4)
                  ),
                ),disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Color(0xfff4f4f4)
                  ),
                ),focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.grey.shade400
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }


}
