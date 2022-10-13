import 'package:flutter/material.dart';
import 'package:flutter_talk_app/widget/bottom_bar.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late TabController controller;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'lydiaNetflix',
      theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.black,
          accentColor: Colors.white),
      home: DefaultTabController(
        length: 4, // 바텀 메뉴 개수
        child: Scaffold(
          body: TabBarView(physics: NeverScrollableScrollPhysics(), children: [
            //안에 넣을 화면
            Container(
              child: Center(
                child: Text('search'),
              ),
            ),
            Container(
              child: Center(
                child: Text('save'),
              ),
            ),
            Container(
              child: Center(
                child: Text('home'),
              ),
            ),
            Container(
              child: Center(
                child: Text('list'),
              ),
            ),
          ]),
          bottomNavigationBar: Bottom(), // 바텀,
        ),
      ),
    );
    // 직접 손으로 탭 조정하는 것을 막겠다는 옵션))
  }
}
