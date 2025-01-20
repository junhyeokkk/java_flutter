import 'package:flutter/material.dart';
import 'package:flutter_tinder_app/screens/main_screen.dart';

void main() {
  runApp(TinderUI());
}

class TinderUI extends StatelessWidget {
  const TinderUI({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TinderUI',
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}
