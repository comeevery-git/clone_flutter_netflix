import 'package:flutter/material.dart';
import '../model/model_movie.dart';
import '../screen/detail_screen.dart';

// 상태 변화가 없는 원형 위젯
class CirecleSlider extends StatelessWidget {
  final List<Movie>? movies;
  CirecleSlider({this.movies});

  @override
  Widget build(BuildContext context) {
    // home_screen.dart 에서 movies 넘겨받음
    return Container(
        padding: EdgeInsets.all(7),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('미리보기'),
              Container(
                height: 120,
                child: ListView(
                  scrollDirection:
                      Axis.horizontal, // horizontal: 좌우 스크롤, vertical 위아래 스크롤
                  children: makeCircleImages(context, movies!),
                ),
              ),
            ]));
  }

  List<Widget> makeCircleImages(BuildContext context, List<Movie> movies) {
    List<Widget> results = [];
    for (var i = 0; i < movies.length; i++) {
      results.add(InkWell(
        onTap: () {
          // 영화 상세로 이동
          Navigator.of(context).push(MaterialPageRoute<Null>(
              fullscreenDialog: true,
              builder: (BuildContext context) {
                return DetailScreen(
                  movie: movies[i],
                );
              }));
        },
        splashColor: Colors.transparent,
        hoverColor: Colors.transparent, // 클릭 이벤트 컬러 투명하게 변경
        highlightColor: Colors.transparent,
        child: Container(
          padding: EdgeInsets.only(right: 10),
          child: Align(
            alignment: Alignment.centerLeft,
            child: CircleAvatar(
                backgroundImage: AssetImage('images/' + movies[i].poster)),
          ),
        ),
      ));
    }
    return results;
  }
}
