import 'package:flutter/material.dart';
import 'package:flutter_talk_app/model/model_movie.dart';
import 'package:flutter_talk_app/widget/%08carousel_slider.dart';

// 영화정보를 백엔드에서 가져오기 위해 StatefulWidget 생성
class HomeScreen extends StatefulWidget {
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // 임시 무비 객체
  List<Movie> movies = [
    Movie.fromMap({
      'title': '사랑의 불시착',
      'keyword': '사랑/로맨스/판타지',
      'poster': 'test_movie_1.png',
      'like': false
    }),
    Movie.fromMap({
      'title': '사랑의 전쟁터',
      'keyword': '사랑/로맨스/스릴러',
      'poster': 'test_movie_1.png',
      'like': false
    }),
    Movie.fromMap({
      'title': '외+계인 1부',
      'keyword': '판타지/SF',
      'poster': 'test_movie_1.png',
      'like': false
    }),
    Movie.fromMap({
      'title': '코-메디',
      'keyword': '코믹',
      'poster': 'test_movie_1.png',
      'like': false
    }),
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[
      // 상단 바에 ListView 안에 Stack 생성, CarouselImageSlider와 TopBar 추가
      Stack(
        children: <Widget>[
          CarouselImage(movies: movies),
          TopBar(),
        ],
      )
    ]);
    // return TopBar();
    // return Container(
    //   child: Center(
    //     child: Text('찐 홈'),
    //   ),
    // );
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
