import 'package:flutter/material.dart';

class BottomSearchScreen extends StatefulWidget {
  const BottomSearchScreen({super.key});

  @override
  State<BottomSearchScreen> createState() => _LocationPageState();
}

class _LocationPageState extends State<BottomSearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Center(
        child: Text("Bottom search"),
      ),
    );
  }
}
