import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_talk_app/widget/carousel_slider.dart';
import 'package:flutter_talk_app/widget/circle_slider.dart';
import '../model/model_movie.dart';
import '../widget/box_slider.dart';

// 영화정보를 백엔드에서 가져오기 위해 StatefulWidget 생성
class HomeScreen extends StatefulWidget {
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Stream<QuerySnapshot>? streamData;

  // 임시 무비 객체
  // List<Movie> movies = [
  //   Movie.fromMap({
  //     'title': '사랑의 불시착',
  //     'keyword': '사랑/로맨스/판타지',
  //     'poster': 'test_movie_1.png',
  //     'like': false
  //   }),
  // ];

  @override
  void initState() {
    super.initState();
    streamData = firestore.collection('movie').snapshots();
  }

  // firestore 실제 데이터 패치
  Widget _fetchData(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('movie').snapshots(),
      builder: (context, snapshot) {
        // 데이터 못가져 왔을 시 LinearProgressIndicator 로딩화면
        if (!snapshot.hasData) return LinearProgressIndicator();
        // 데이터 가져왔다면 _buildBody 호출하여 실제 위젯 생성
        return _buildBody(context, snapshot.data!.docs);
      },
    );
  }

  Widget _buildBody(BuildContext context, List<DocumentSnapshot> snapshot) {
    List<Movie> movies = snapshot.map((d) => Movie.fromSnapshot(d)).toList();
    return ListView(children: <Widget>[
      // 상단 - 바에 ListView 안에 Stack 생성, CarouselImageSlider와 TopBar 추가
      Stack(
        children: <Widget>[
          CarouselImage(movies: movies),
          TopBar(),
        ],
      ),
      // 중단 - 원형 슬라이더
      CirecleSlider(movies: movies),
      // 중단 - 박스 슬라이더
      BoxSlider(movies: movies)
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return _fetchData(context);
  }
}

// 홈 이미지 위에 상단바가 투명하게 올라가있음 - 스택 사용
// 홈에서만 사용되기 때문에 Widget 으로 분리하지 않고 여기서 작성
class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 7, 20, 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // 간격 조정
        children: <Widget>[
          Image.asset(
            'images/flix_logo.png',
            fit: BoxFit.contain,
            height: 25,
          ),
          Container(
            padding: EdgeInsets.only(right: 1),
            child: Text(
              'TV 프로그램',
              style: TextStyle(fontSize: 14),
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 1),
            child: Text(
              '영화',
              style: TextStyle(fontSize: 14),
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 1),
            child: Text(
              '내가 찜한 콘텐츠',
              style: TextStyle(fontSize: 14),
            ),
          )
        ],
      ),
    );
  }
}
