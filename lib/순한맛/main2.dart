/*
  1. Route 개념 = Android's activity
  2. Navigator 정의와 push, pop 함수, stack 자료구조
  3. MaterialPageRoute위젯과 contet
  4. 페이지 이동 기능 구현 완성
 */

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp( // 모든 위젯은 Material Widget 이 감싸고 있어야 한다
      title: 'Appbar',
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("First page"),
      ),
      body: RaisedButton(
        child: Text('Go to the Second page'),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
              /*builder: (BuildContext context) {
                return SecondPage();
              }*/
              // builder: (context) => SecondPage()
              builder: (_) => SecondPage()
          ));
          // second page 는 first page 위로 가리게 됨
          // context? 위젯 트리의 위치 정보에 근거에서 현재 화면상에 보여지는 페이지가 어떤 화면인지 확인하고
          // 이 페이지 위에 새로운 페이지를 쌓아 올리기 때문
          // FirstPage 의 위치를 정확히 알아야 그 위에 SecondPage 를 올릴 수 있다
        },
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second page"),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Go to the First page'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
