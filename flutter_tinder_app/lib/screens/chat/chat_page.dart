import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // 배경색 검정
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 상단 배너
          _buildBanner(),
          SizedBox(height: 16),
          // 새 매치
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              '새 매치',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 12),
          // 새 매치 카드 리스트
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                _buildMatchCard(
                  count: 35,
                  label: 'LIKE',
                  highlightColor: Colors.yellow,
                ),
                SizedBox(width: 12),
                _buildMatchCard(), // 빈 카드
                SizedBox(width: 12),
                _buildMatchCard(), // 빈 카드
                SizedBox(width: 12),
                _buildMatchCard(), // 빈 카드
              ],
            ),
          ),
          SizedBox(height: 24),
          // "지금 스와이프하세요!" 섹션
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.grey[800],
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.credit_card,
                            color: Colors.green,
                            size: 40,
                          ),
                          SizedBox(height: 8),
                          Text(
                            'LIKE',
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 24),
                  Column(
                    children: [],
                  ),
                  Text(
                    '지금 스와이프하세요!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '다른 회원들과 매치되면 이곳에 표시되고 메시지를\n보낼 수 있습니다.',
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 새 매치 카드 생성 함수
  Widget _buildMatchCard({int? count, String? label, Color? highlightColor}) {
    return Container(
      width: 80,
      height: 100,
      decoration: BoxDecoration(
        border: Border.all(
          color: highlightColor ?? Colors.grey[800]!,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey[900],
      ),
      // 카운트 라벨 없으면 빈 카드
      child: count != null && label != null
          ? Stack(children: [
              Center(
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: highlightColor ?? Colors.grey[800],
                  child: Text(
                    '$count',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8),
              Positioned(
                bottom: -25,
                right: 25,
                child: Column(
                  children: [
                    Icon(
                      Icons.swipe,
                      color: highlightColor ?? Colors.grey,
                      size: 16,
                    ),
                    SizedBox(width: 4),
                    Text(
                      label,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ])
          : null, // 빈 카드면 널
    );
  }

  // 상단 배너 만드는 함수
  Widget _buildBanner() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      color: Colors.grey[900], // 배너 배경색
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey,
                radius: 20,
                child: Icon(
                  Icons.circle,
                  color: Colors.black,
                  size: 20,
                ),
              ),
              SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tinder 플래티넘 50% 할인 받기',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '남은 할인 기간: 00:26:56',
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Icon(
            Icons.chevron_right,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
