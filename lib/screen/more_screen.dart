import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

class MoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: <Widget>[
            // 마이페이지 - 프로필 사진
            Container(
              padding: EdgeInsets.only(top: 50),
              child: CircleAvatar(
                radius: 100,
                backgroundImage: AssetImage('images/flix_logo.png'),
              ),
            ),
            // 마이페이지 - 이름
            Container(
              padding: EdgeInsets.only(top: 15),
              child: Text(
                'Lydia',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.white),
              ),
            ),
            // 마이페이지 - 이름 하단 굵은색 라인
            Container(
              padding: EdgeInsets.all(15),
              width: 140,
              height: 5,
              color: Colors.red,
            ),
            // 마이페이지 - 링크
            // Container(
            //   padding: EdgeInsets.all(10),
            //   child: Text('https://github.com/comeevery-git'),
            // ),
            // 클릭 가능한 주소로 만들기 위해 Linkify 패키지 사용
            Container(
              padding: EdgeInsets.all(10),
              // 링크를 여는 것과 같이 바로 실행되지 않는 기능은 async & await 비동기 처리
              child: Linkify(
                onOpen: (link) async {
                  if (await canLaunch(link.url)) {
                    await launch(link.url);
                  }
                },
                text: 'https://github.com/comeevery-git',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                linkStyle: TextStyle(color: Colors.white),
              ),
            ),
            // 마이페이지 - 버튼
            Container(
              padding: EdgeInsets.all(10),
              child: TextButton(
                // FlatButton => TextButton 대체됨
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.red)),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '프로필 수정하기',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
