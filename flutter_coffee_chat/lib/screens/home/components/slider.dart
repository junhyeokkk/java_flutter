import 'package:flutter/material.dart';

class TopSlider extends StatelessWidget {
  const TopSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 상단 슬라이더와 이벤트 설명
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blueAccent, Colors.greenAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text(
                      '최신버전 앱 필수',
                      style: TextStyle(color: Colors.blueAccent, fontSize: 12),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    '커피챗 노트 오픈 이벤트',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '스타벅스부터 커피챗 할인 쿠폰까지!\n커피챗 노트로 파트너들의 인사이트를 확인하세요.',
                        style: TextStyle(fontSize: 14, color: Colors.white70),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 4.0),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: Text(
                          '1 / 8',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 16),
          // 카테고리 아이콘 섹션
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                _buildCategoryIcon(Icons.business, '대기업'),
                _buildCategoryIcon(Icons.start, '스타트업'),
                _buildCategoryIcon(Icons.language, '외국계'),
                _buildCategoryIcon(Icons.computer, 'IT/테크'),
                _buildCategoryIcon(Icons.group, '전략컨설팅'),
                _buildCategoryIcon(Icons.school, 'MBA/대학원'),
                _buildCategoryIcon(Icons.flight, '해외취업'),
                _buildCategoryIcon(Icons.account_balance, '금융권'),
              ],
            ),
          ),
          SizedBox(height: 16),
          // 파트너 리스트 섹션
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '지금, 새롭게 등장한 파트너들',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    Text(
                      '전체 보기',
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildPartnerCard('현대자동차', Colors.blue.shade100),
                    _buildPartnerCard('Gucci 구찌코리아', Colors.green.shade100),
                    _buildPartnerCard('Summer05', Colors.pink.shade100),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryIcon(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          backgroundColor: Colors.blue.shade100,
          radius: 30,
          child: Icon(icon, color: Colors.blueAccent, size: 30),
        ),
        SizedBox(height: 8),
        Text(label, style: TextStyle(fontSize: 12, color: Colors.black87)),
      ],
    );
  }

  Widget _buildPartnerCard(String name, Color color) {
    return Container(
      width: 100,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          name,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
