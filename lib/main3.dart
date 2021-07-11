import 'package:flutter/material.dart';

import 'ScreenA.dart';
import 'ScreenB.dart';
import 'ScreenC.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: ScreenA() // App 이 처음 실행 될 때 보여주는 route 값
      initialRoute: '/', // home 도 정의하면 중복되어 에러남
      routes: {
        '/' : (context) => ScreenA(),
        '/a' : (context) => ScreenA(),
        '/b' : (context) => ScreenB(),
        '/c' : (context) => ScreenC(),
      }, // {} Map
    );
  }
}
