import 'package:flutter/material.dart';
import '../model/model_movie.dart';
import 'dart:ui'; // 이미지 배경 처리를 위해 가져옴

// 영화 세부정보 페이지
class DetailScreen extends StatefulWidget {
  final Movie? movie;
  DetailScreen({this.movie});
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool like = false;

  @override
  void initState() {
    super.initState();
    like = widget.movie!.like; // 해당 영화 찜하기 상태 가져오기
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: ListView(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/' + widget.movie!.poster),
                      ),
                    ),
                    // 포스터 블러처리 후 배경으로 지정
                    child: ClipRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Container(
                          // 원본 이미지 작은 형태로 중앙에 배치
                          alignment: Alignment.center,
                          color: Colors.black.withOpacity(0.1),
                          child: Container(
                            child: Column(children: <Widget>[
                              Container(
                                padding: EdgeInsets.fromLTRB(0, 45, 0, 10),
                                child: Image.asset(
                                    'images/' + widget.movie!.poster),
                                height: 300,
                              ),

                              // 영화 상세 - 문구
                              Container(
                                padding: EdgeInsets.all(7),
                                child: Text(
                                  '99% 일치 2019 15+ 시즌 1개',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 13),
                                ),
                              ),

                              // 영화 상세 - 타이틀
                              Container(
                                padding: EdgeInsets.all(7),
                                child: Text(
                                  widget.movie!.title,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ),

                              // 영화 상세 - 재생 버튼
                              Container(
                                padding: EdgeInsets.only(right: 10),
                                child: TextButton(
                                  // FlatButton => TextButton 대체됨
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.red)),
                                  onPressed: () {},
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(
                                        Icons.play_arrow,
                                        color: Colors.white,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(3),
                                      ),
                                      Text(
                                        '재생',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              // 영화 상세 - 영화 설명
                              Container(
                                padding: EdgeInsets.all(5),
                                child: Text(
                                  widget.movie.toString(),
                                  style: TextStyle(
                                    color: Colors.white60,
                                    fontSize: 12,
                                  ),
                                ),
                              ),

                              // 영화 상세 - 출연진
                              Container(
                                padding: EdgeInsets.all(5),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  '출연: 누구1, 누구2, 누구3\n제작: 누구4, 누구5',
                                  style: TextStyle(
                                    color: Colors.white60,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ]),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // 기본 팝업 다이얼로그 - 닫기 버튼 생성 및 기본기능 제공
                  Positioned(
                      child: AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                  ))
                ],
              ),
              // makeMenuButton(), 함수 형태로도 붙여도 무방

              Container(
                color: Colors.black26,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    // 영화상세 - 내가 찜한 콘텐츠 btn
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: InkWell(
                        onTap: () {},
                        child: Column(children: <Widget>[
                          like ? Icon(Icons.check) : Icon(Icons.add),
                          Padding(padding: EdgeInsets.all(5)),
                          Text(
                            '내가 찜한 콘텐츠',
                            style:
                                TextStyle(fontSize: 11, color: Colors.white60),
                          ),
                        ]),
                      ),
                    ),

                    // 영화상세 - 평가 btn
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Icon(Icons.thumb_up),
                            Padding(padding: EdgeInsets.all(5)),
                            Text(
                              '평가',
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.white60,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // 영화상세 - 공유 btn
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Icon(Icons.send),
                            Padding(padding: EdgeInsets.all(5)),
                            Text(
                              '공유',
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.white60,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget makeMenuButton() {
  return Container();
}
