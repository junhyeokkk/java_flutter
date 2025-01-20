import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_coffee_chat/screens/add/add_page.dart';
import 'package:flutter_coffee_chat/screens/home/home_page.dart';

import 'package:flutter_coffee_chat/screens/my_coffeechat/my_coffeechat_page.dart';
import 'package:flutter_coffee_chat/screens/note/note_page.dart';
import 'package:flutter_coffee_chat/screens/search/search_page.dart';

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
            MyCoffeechatPage(),
            NotePage(),
            AddPage(),
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
            BottomNavigationBarItem(label: '홈', icon: Icon(Icons.home_filled)),
            BottomNavigationBarItem(label: '검색', icon: Icon(Icons.search)),
            BottomNavigationBarItem(label: '나의 커피챗', icon: Icon(Icons.coffee)),
            BottomNavigationBarItem(
                label: '노트', icon: Icon(Icons.sticky_note_2_rounded)),
            BottomNavigationBarItem(label: '더보기', icon: Icon(Icons.add)),
          ],
        ),
      ),
    );
  }
}
