import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AllRestaurant extends StatefulWidget {
  const AllRestaurant({super.key});

  @override
  State<AllRestaurant> createState() => _AllRestaurantState();
}

class _AllRestaurantState extends State<AllRestaurant> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("All Restaurant",style: GoogleFonts.nunitoSans(),),
      ),
    );
  }
}
