class Movie {
  // 모델에 들어갈 요소들
  final String title; // 제목
  final String keyword; // 키워드
  final String poster; // 포스터
  final bool like; // 찜 확인

  Movie.fromMap(Map<String, dynamic> map)
      : title = map['title'],
        keyword = map['keyword'],
        poster = map['poster'],
        like = map['like'];

  @override
  String toString() => "Movie<$title:$keyword>";
}
