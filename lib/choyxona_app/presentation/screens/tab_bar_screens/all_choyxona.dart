import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AllChoyxona extends StatefulWidget {
  const AllChoyxona({super.key});

  @override
  State<AllChoyxona> createState() => _AllChoyxonaState();
}

class _AllChoyxonaState extends State<AllChoyxona> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("All Choyxona",style: GoogleFonts.nunitoSans(),),
      ),
    );
  }
}
