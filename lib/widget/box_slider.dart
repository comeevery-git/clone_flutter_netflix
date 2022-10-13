import 'package:flutter/material.dart';
import '../model/model_movie.dart';
import '../screen/detail_screen.dart';

class BoxSlider extends StatelessWidget {
  final List<Movie>? movies;
  BoxSlider({this.movies});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(7),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('지금 뜨는 콘텐츠'),
          Container(
            height: 120,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: makeBoxImages(context, movies!),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> makeBoxImages(BuildContext context, List<Movie> movies) {
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
        splashColor: Colors.black38,
        hoverColor: Colors.black12, // 클릭 이벤트 컬러 투명하게 변경
        highlightColor: Colors.black45,
        child: Container(
          padding: EdgeInsets.only(right: 10),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Image.asset('images/' + movies[i].poster),
          ),
        ),
      ));
    }
    return results;
  }
}
