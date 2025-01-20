class Picture {
  final String imgUrl;
  final bool isOnline;
  final String? name; // 이름
  final int? age; // 나이
  final String? timeLeft; // 남은 시간 (예: '11시간 남음')

  Picture({
    required this.imgUrl,
    this.isOnline = false,
    this.name,
    this.age,
    this.timeLeft,
  });
}

List<Picture> pictures = [
  Picture(imgUrl: 'assets/kang.png', isOnline: false),
  Picture(imgUrl: 'assets/hee.jpg', isOnline: false),
  Picture(imgUrl: 'assets/jang.jpg', isOnline: true),
  Picture(imgUrl: 'assets/karina.jpg', isOnline: false),
  Picture(imgUrl: 'assets/yujin.jpg', isOnline: true),
  Picture(imgUrl: 'assets/winter.jpg', isOnline: false),
  Picture(imgUrl: 'assets/IU.jpg', isOnline: false),
];

List<Picture> pickPictures = [
  Picture(
    imgUrl: 'assets/hee.jpg',
    isOnline: true,
    name: '김민희',
    age: 30,
    timeLeft: '11시간 남음',
  ),
  Picture(
    imgUrl: 'assets/jang.jpg',
    isOnline: true,
    name: '장원영',
    age: 26,
    timeLeft: '11시간 남음',
  ),
  Picture(
    imgUrl: 'assets/karina.jpg',
    isOnline: false,
    name: '카리나',
    age: 23,
    timeLeft: '12시간 남음',
  ),
  Picture(
    imgUrl: 'assets/yujin.jpg',
    isOnline: true,
    name: '안유진',
    age: 26,
    timeLeft: '1시간 남음',
  ),
  Picture(
    imgUrl: 'assets/winter.jpg',
    isOnline: false,
    name: '윈터',
    age: 26,
    timeLeft: '3시간 남음',
  ),
  Picture(
    imgUrl: 'assets/IU.jpg',
    isOnline: false,
    name: '아이유',
    age: 26,
    timeLeft: '10시간 남음',
  ),
];
