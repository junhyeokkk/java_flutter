import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tinder_app/screens/chat/chat_page.dart';
import 'package:flutter_tinder_app/screens/home/home_page.dart';
import 'package:flutter_tinder_app/screens/match/match_page.dart';
import 'package:flutter_tinder_app/screens/my_profiile/my_profile_page.dart';
import 'package:flutter_tinder_app/screens/search/search_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectIndex = 0;

  void changeStackPages(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: IndexedStack(
          index: _selectIndex,
          children: [
            HomePage(),
            SearchPage(),
            MatchPage(),
            ChatPage(),
            MyProfilePage(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectIndex,
          onTap: (index) {
            changeStackPages(index);
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home_filled)),
            BottomNavigationBarItem(icon: Icon(Icons.search)),
            BottomNavigationBarItem(icon: Icon(Icons.coffee)),
            BottomNavigationBarItem(icon: Icon(Icons.sticky_note_2_rounded)),
            BottomNavigationBarItem(icon: Icon(Icons.add)),
          ],
        ),
      ),
    );
  }
}
