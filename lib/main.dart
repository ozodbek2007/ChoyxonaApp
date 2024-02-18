import 'package:flutter/material.dart';
import 'package:untitled2/choyxona_app/presentation/screens/bottom_screens/home_page.dart';
import 'package:untitled2/choyxona_app/presentation/screens/main_page.dart';
import 'package:untitled2/choyxona_app/presentation/screens/single_screens/welcome_page.dart';


void main(){
  runApp(ChoyxonaApp());
}
class ChoyxonaApp extends StatelessWidget {
  const ChoyxonaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: Color(0xfff4f4f4)
      ),
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}
