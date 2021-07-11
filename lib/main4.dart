/*
  위젯 구조 상 모든 위젯은 MaterialWidget 이 감싸고 있어야 한다
  모든 위젯은 MaterialWidget 의 child 여야 한다

  MyApp 에서 Navigator.push(...) 를 호출하는 경우
  builder 의 context 는 MyApp 의 context 만을 가지고 있기에
  새롭게 쌓으려는 ScreenA 의 부모로는 MaterialWidget 이 없어서 에러가 생기는 것

  1. push 함수가 MaterialWidget 의 child 의 context 를 사용하게 하거나
  2. Material Widget 밑에서 새로운 위젯을 생성하는 빌더를 사용하는 것
 */

import 'package:flutter/material.dart';

void main() => runApp(MyPage());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: Center(
      //   child: RaisedButton(
      //     child: Text('Go to ScreenA'),
      //     onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ScreenA())),
      //   )
      // )
      home: MyPage(),
    );
  }
}

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        child: Text('Go to ScreenA'),
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ScreenA())),
      )
    );
  }
}

class ScreenA extends StatelessWidget {
  const ScreenA({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Hi, there!')
      )
    );
  }
}
