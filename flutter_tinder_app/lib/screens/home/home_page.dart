import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // 프로필 이미지와 정보
          Expanded(
            child: Stack(
              children: [
                // 프로필 이미지
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/hee.jpg'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                // 프로필 정보
                Positioned(
                  bottom: 100,
                  left: 16,
                  right: 16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              '근처',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(width: 8),
                          Text(
                            '김민희 30 미혼',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(
                            CupertinoIcons.location_solid,
                            color: Colors.white70,
                            size: 16,
                          ),
                          SizedBox(width: 4),
                          Text(
                            '8km 거리에 있음',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // 하단 버튼 영역
          Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              color: Colors.black,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // 재시도 버튼
                CircleButton(
                  icon: Icons.replay,
                  color: Colors.grey,
                  size: 60,
                ),
                // 싫어요 버튼
                CircleButton(
                  icon: Icons.close,
                  color: Colors.pink,
                  size: 70,
                ),
                // 슈퍼 좋아요 버튼
                CircleButton(
                  icon: Icons.star,
                  color: Colors.blue,
                  size: 60,
                ),
                // 좋아요 버튼
                CircleButton(
                  icon: Icons.favorite,
                  color: Colors.green,
                  size: 70,
                ),
                // 부스터 버튼
                CircleButton(
                  icon: CupertinoIcons.paperplane_fill,
                  color: Colors.purple,
                  size: 60,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// 원형 버튼 위젯
class CircleButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final double size;

  const CircleButton({
    required this.icon,
    required this.color,
    required this.size,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      child: Icon(
        icon,
        color: color,
        size: size * 0.5,
      ),
    );
  }
}
