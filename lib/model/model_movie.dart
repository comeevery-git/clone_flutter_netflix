import 'package:cloud_firestore/cloud_firestore.dart';

class Movie {
  // 모델에 들어갈 요소들
  final String title; // 제목
  final String keyword; // 키워드
  final String poster; // 포스터
  final bool like; // 찜 확인
  final DocumentReference? reference; // 실제 Firebase firestore 데이터 참조

  Movie.fromMap(Map<String, dynamic> map, {this.reference})
      : title = map['title'],
        keyword = map['keyword'],
        poster = map['poster'],
        like = map['like'];

  Movie.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data as Map<String, dynamic>,
            reference: snapshot.reference);

  @override
  String toString() => "Movie<$title:$keyword>";
}
