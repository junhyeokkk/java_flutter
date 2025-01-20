import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_tinder_app/models/picture.dart';

class MatchPage extends StatelessWidget {
  const MatchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // 탭의 개수
      child: Scaffold(
        backgroundColor: Colors.black, // 배경색 검정
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0, // 그림자 제거
          title: Row(
            children: [
              Icon(
                Icons.local_fire_department,
                color: Colors.red,
                size: 24,
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
          bottom: TabBar(
            labelColor: Colors.white, // 탭 색상
            unselectedLabelColor: Colors.white54,
            indicatorColor: Colors.red,
            indicatorWeight: 2,
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: [
              Tab(
                text: 'LIKE ${pictures.length}개',
              ),
              Tab(
                text: '오늘의 PICK',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
//////////////////////////////////////////////////////////////////////////
            // LIKE 탭
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      _buildFilterChip(Icons.favorite_border, '주변'),
                      SizedBox(width: 8),
                      _buildFilterChip(Icons.description, '자기소개 완료'),
                      SizedBox(width: 8),
                      _buildFilterChip(Icons.verified, '프로필 인증 완료'),
                      SizedBox(width: 8),
                      _buildFilterChip(Icons.check_circle, '통과'),
                      SizedBox(width: 8),
                      _buildFilterChip(Icons.directions_walk, '동네 산책'),
                      SizedBox(width: 8),
                      _buildFilterChip(CupertinoIcons.music_mic, '노래방'),
                      SizedBox(width: 8),
                      _buildFilterChip(Icons.wine_bar, '와인'),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                // 설명 텍스트
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Center(
                    child: Text(
                      'Tinder 골드로 업그레이드하면\n내가 받은 LIKE를 볼 수 있어요',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(height: 16),
                // 카드 그리드
                Expanded(
                  child: Stack(
                    children: [
                      // 카드 그리드
                      GridView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                          childAspectRatio: 0.8,
                        ),
                        itemCount: pictures.length,
                        itemBuilder: (context, index) {
                          final picture = pictures[index];
                          return _buildCard(picture); // Picture 객체 전달
                        },
                      ),
                      Positioned(
                        left: 100,
                        right: 100,
                        bottom: 50,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Colors.yellow, Colors.orangeAccent],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 0, // 그림자 제거 (그라데이션 강조를 위해)
                              backgroundColor:
                                  Colors.transparent, // 투명 배경 (그라데이션 유지)
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              padding: EdgeInsets.symmetric(
                                  vertical: 20), // 버튼 높이 조정
                            ),
                            onPressed: () {
                              // 버튼 클릭 이벤트
                            },
                            child: Text(
                              '내가 받은 LIKE 보기',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
//////////////////////////////////////////////////////////////////////
            // 오늘의 pick 탭
            Column(
              children: [
                SizedBox(height: 16),
                Center(
                  child: Text(
                    'Tinder 골드로 업그레이드하면\n 오늘의 PICK을 더 많이 볼 수 있어요!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 16),
                // 카드 그리드
                Expanded(
                  child: Stack(
                    children: [
                      // 카드 그리드
                      GridView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                          childAspectRatio: 0.8,
                        ),
                        itemCount: pickPictures.length,
                        itemBuilder: (context, index) {
                          final picture = pickPictures[index];
                          return _buildPickCard(picture); // Picture 객체 전달
                        },
                      ),
                      Positioned(
                        left: 100,
                        right: 100,
                        bottom: 50,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Colors.yellow, Colors.orangeAccent],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 0, // 그림자 제거 (그라데이션 강조를 위해)
                              backgroundColor:
                                  Colors.transparent, // 투명 배경 (그라데이션 유지)
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              padding: EdgeInsets.symmetric(
                                  vertical: 20), // 버튼 높이 조정
                            ),
                            onPressed: () {
                              // 버튼 클릭 이벤트
                            },
                            child: Text(
                              '내가 받은 LIKE 보기',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  // 필터 버튼 생성 함수
  Widget _buildFilterChip(IconData icon, String label) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.white, size: 16),
          SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
        ],
      ),
    );
  }

  // LIKE 카드 생성 함수
  Widget _buildCard(Picture picture) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: AssetImage(picture.imgUrl), // Picture 객체에서 이미지 URL 사용
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          if (picture.isOnline)
            Positioned(
              left: 8,
              bottom: 8,
              child: Row(
                children: [
                  Icon(Icons.circle, color: Colors.green, size: 10),
                  SizedBox(width: 4),
                  Text(
                    '최근 ONLINE',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  // 오늘의 PICK 카드 생성 함수
  Widget _buildPickCard(Picture picture) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: AssetImage(picture.imgUrl), // Picture 객체에서 이미지 URL 사용

          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 8,
            left: 8,
            right: 8,
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3), // 반투명 배경
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${picture.name}, ${picture.age}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    picture.timeLeft ?? '',
                    style: TextStyle(
                      color: Colors.yellow,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 27,
            right: 15,
            child: Icon(
              Icons.star,
              color: Colors.blue,
              size: 25,
            ),
          ),
        ],
      ),
    );
  }
}
