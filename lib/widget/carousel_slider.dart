import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_talk_app/model/model_movie.dart';

import '../screen/detail_screen.dart';

// 해당 위젯은 이미지를 보여주면서 찜하기, 디테일 페이지를 띄우는 기능을 담고있기 때문에 StatefulWidget
class CarouselImage extends StatefulWidget {
  final List<Movie>? movies; // List<Movie>, nullable 로 수정
  CarouselImage({this.movies}); // 홈 화면에서 movies 넘겨받음
  _CarouselImageState createState() => _CarouselImageState();
}

class _CarouselImageState extends State<CarouselImage> {
  List<Movie>? movies;
  List<Widget>? images;
  List<String>? keywords;
  List<bool>? likes;
  int _currentPage = 0; // 어느 위치에 있는 지 관리
  String? _currentKeyword; // 해당 페이지에 기록되어 있는 현재 keyword 관리

  @override
  void initState() {
    super.initState();
    movies = widget.movies;
    images = movies?.map((m) => Image.asset('./images/' + m.poster)).toList();
    keywords = movies?.map((m) => m.keyword).toList();
    likes = movies?.map((m) => m.like).toList();
    _currentKeyword = keywords![0]; // 키워드 초기값 설정
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
          ),
          CarouselSlider(
            items: images,
            options: CarouselOptions(onPageChanged: (index, reason) {
              setState(() {
                _currentPage = index;
                _currentKeyword = keywords![_currentPage];
              });
            }),
          ),
          // 슬라이더 하단 설명란
          Container(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 3),
            child: Text(_currentKeyword!, style: TextStyle(fontSize: 11)),
          ),
          // 메뉴 바
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                    child: Column(
                  children: <Widget>[
                    // 찜하기 버튼 체크 유무 아이콘
                    likes![_currentPage]
                        ? IconButton(onPressed: () {}, icon: Icon(Icons.check))
                        : IconButton(onPressed: () {}, icon: Icon(Icons.add)),
                    Text(
                      '내가 찜한 콘텐츠',
                      style: TextStyle(fontSize: 11),
                    )
                  ],
                )),
                // 재생 버튼
                Container(
                  padding: EdgeInsets.only(right: 10),
                  child: TextButton(
                    // FlatButton => TextButton 대체됨
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.white)),
                    onPressed: () {},
                    child: Row(children: <Widget>[
                      Icon(
                        Icons.play_arrow,
                        color: Colors.black,
                      ),
                      Padding(
                        padding: EdgeInsets.all(3),
                      ),
                      Text(
                        '재생',
                        style: TextStyle(color: Colors.black),
                      )
                    ]),
                  ),
                ),
                // 목록 버튼
                Container(
                  padding: EdgeInsets.only(right: 10),
                  child: Column(children: <Widget>[
                    IconButton(
                      onPressed: () {
                        // 영화 상세로 이동
                        Navigator.of(context).push(MaterialPageRoute<Null>(
                            fullscreenDialog: true,
                            builder: (BuildContext context) {
                              return DetailScreen(
                                movie: movies![_currentPage],
                              );
                            }));
                      },
                      icon: Icon(Icons.info),
                    ),
                    Text('정보', style: TextStyle(fontSize: 11))
                  ]),
                ),
              ],
            ),
          ),
          Container(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: makeIndicator(likes!, _currentPage),
          ))
        ],
      ),
    );
  }

  // 인디케이터 작성
  List<Widget> makeIndicator(List list, int _currentPage) {
    List<Widget> results = [];
    for (var i = 0; i < list.length; i++) {
      results.add(Container(
        width: 8,
        height: 8,
        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: _currentPage == i
              ? Color.fromRGBO(255, 255, 255, 0.9)
              : Color.fromRGBO(255, 255, 255, 0.4),
        ),
      ));
    }
    return results;
  }
}
