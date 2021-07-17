import 'package:flutter/material.dart';

/// const vs final (제어자)
///
/// A final variable can be set only once - It's a run-time constant
/// a const variable is a compile-time constant
/// Const variables are implicitly final
/// A final top-level or class variable is initialized the first time it's used
///
/// final 변수 초기화 방법
/// 1) 변수 선언시
/// 2) 객체 생성시 생성자를 통한 초기화

void fun1() {
  int age; // 메모리 어딘가에 4 바이트 자리를 잡고 그 위치를 age 라고 부른다
  age = 20; // age 라고 불리는 위치에 20 이라는 값을 집어 넣음
}

void fun2() {
  final int myFinal = 30;
  const int myConst = 70;

  myFinal = 20; // compile error
  myConst = 50; // compiile error
}


class Person {
  final int age; // run-time constant (const X)
  String name;

  Person(this.age, this.name);
}

void fun3() {
  Person p 1 = new Person(21, 'Tom'); // 생성자를 통해 초기화
  print(p1.age);
}

/// Stateless widget
/// 한번 생성되면 절대로 state 가 변하지 않는 immutable 한 성질을 가진다.
/// 무언가 state 가 변하면 새롭게 build method 로 모든 요소를 rebuild 해야 함.
/// 한번 초기화 되면 immutable 한 특성을 지니기 때문에 값을 바꾸려면 새롭게 rebuild 하는 과정을 거쳐야 한다
///
/// final 키워드는 runtime constant 이기 때문에 앱 실행 전에 꼭 초기화 할 필요 없이
/// 앱 실행 중간에 값을 초기화 할 수 있다.

class Question extends StatelessWidget {

  final String question;
  Question(this.question);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        onPressed: (){},
        child: Text(question),
      )
    );
  }
}

void fun4() {
  const time = DateTime.now();
  // 현재 시간은 매번 호출때마다 값이 달라지기 때문에
  // 런타임 상수에만 할당할 수 있으나
  // const 는 컴파일 타임 상수라서 컴파일 에러난다.
}

/// Final and Const variable
///
/// const 변수는 컴파일 시에 상수화
/// final 변수는 런타임 시에 상수화
/// Compile time constant 는 Run time 에도 상수이다
/// (Compile time constant < Run time constant)
/// final 변수는 rebuild 시 값을 다시 초기화 할 수 있다.