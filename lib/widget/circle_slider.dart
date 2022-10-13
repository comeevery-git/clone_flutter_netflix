import 'package:flutter/material.dart';
import '../model/model_movie.dart';

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
                  children: makeCircleImages(movies!),
                ),
              ),
            ]));
  }

  List<Widget> makeCircleImages(List<Movie> movies) {
    List<Widget> results = [];
    for (var i = 0; i < movies.length; i++) {
      results.add(InkWell(
        onTap: () {},
        splashColor: Colors.transparent,
        hoverColor: Colors.transparent, // 클릭 이벤트 컬러 투명하게 변경
        highlightColor: Colors.black45,
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
