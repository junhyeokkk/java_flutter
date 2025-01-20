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

  // 페이지별로 다른 앱바
  PreferredSizeWidget? getAppBar() {
    switch (_selectIndex) {
      case 0: // HomePage
        return AppBar(
          backgroundColor: Colors.black,
          title: Row(
            children: [
              Icon(
                Icons.local_fire_department,
                color: Colors.red,
              ),
              SizedBox(width: 8),
              Text(
                'tinder',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          actions: [
            Icon(CupertinoIcons.bell, color: Colors.white),
            SizedBox(width: 16),
            Icon(CupertinoIcons.slider_horizontal_3, color: Colors.white),
            SizedBox(width: 16),
            Icon(CupertinoIcons.bolt_fill, color: Colors.purple),
            SizedBox(width: 16),
          ],
        );
      case 1: // SearchPage
        return AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.local_fire_department,
                color: Colors.red,
              ),
              SizedBox(width: 8),
              Text(
                'tinder',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        );
      case 2: // MatchPage
        return AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.local_fire_department,
                color: Colors.red,
              ),
              SizedBox(width: 8),
              Text(
                'tinder',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        );
      case 3: // ChatPage
        return AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.local_fire_department,
                color: Colors.red,
              ),
              SizedBox(width: 8),
              Text(
                'tinder',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(Icons.shield_sharp),
            ),
          ],
        );
      case 4: // MyProfilePage
        return AppBar(
          backgroundColor: Colors.black,
          title: Text(
            '프로필',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          centerTitle: true,
        );
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: getAppBar(),
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
          backgroundColor: Colors.black, // 검정 배경
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.red, // 선택된 아이템 색상
          unselectedItemColor: Colors.grey, // 선택되지 않은 아이템 색상
          currentIndex: _selectIndex,
          onTap: (index) {
            changeStackPages(index);
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.local_fire_department,
              ), // 불꽃 아이콘
              label: '', // 라벨 생략
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.square_grid_2x2), // 네모 격자 아이콘
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Stack(
                // 배지(badge)가 포함된 아이콘
                children: [
                  Icon(CupertinoIcons.sparkles), // 별똥별 아이콘
                  Positioned(
                    right: 0,
                    top: -2,
                    child: Container(
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.yellow,
                        shape: BoxShape.circle,
                      ),
                      constraints: BoxConstraints(
                        minWidth: 16,
                        minHeight: 16,
                      ),
                      child: Text(
                        '35',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 9,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.bubble_left), // 대화 아이콘
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person), // 사람 아이콘
              label: '',
            ),
          ],
          showSelectedLabels: false,
          showUnselectedLabels: false,
        ),
      ),
    );
  }
}
