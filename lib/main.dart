import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'telegram_bot/chats_page.dart';

void main(){
  runApp(ChoyxonaApp());
}
class ChoyxonaApp extends StatelessWidget {
  const ChoyxonaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true
      ),
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}
