/*
  stateful widget 이 rebuild 되는 경우
  - child 위젯의 셍상자를 통해서 데이터가 전달될 때
  - Internal state 가 바뀔 때

  state 를 변화시키려면 반드시 build 메소드를 호출해서 rebuild 해야 함
  -> set state
  - 매개변수로 전달된 함수 호출
  - build 메소드 호출
 */

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
