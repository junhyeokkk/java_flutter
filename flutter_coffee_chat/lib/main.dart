import 'package:flutter/material.dart';
import 'package:flutter_coffee_chat/screens/main_screen.dart';

void main() {
  runApp(CoffeeChatUI());
}

class CoffeeChatUI extends StatelessWidget {
  const CoffeeChatUI({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'coffeechat_ui',
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}
