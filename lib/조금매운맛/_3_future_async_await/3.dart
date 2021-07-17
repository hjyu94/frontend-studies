/// 무조건 기다렸다가 실행해야 하는 경우

import 'dart:io';

void main() {
  showData();
}

void showData() async {
  startTask();
  String account = await accessData();
  fetchData(account);
}

void startTask() {
  String info = '요청수행 시작';
  print(info);
}

/// async 를 사용하면 바디 내에서 await 키워드를 사용할 수 있다.
/// await 가 붙은 명령문 동작이 끝나기를 기다리라는 이야기
Future<String> accessData() async {
  String account = "";
  Duration time = Duration(seconds: 3);

  if(time.inSeconds > 2) {
    await Future.delayed(time, (){
      account = '8,500만원';
      print(account);
    });

  } else {
    account = '데이터에 접속중';
    print(account);
  }

  return account;
}

void fetchData(String account) {
  String info = '잔액은 $account원 입니다';
  print(info);
}

/// Future 클래스는 비동기 작업을 할 때 사용
/// Future 는 일정 소요시간 후에 실제 데이터나 에러를 반환
/// async 클래스는 await 메서드를 가지고 있음
/// - await 로 선언된 메서드는 응답이 처리될 때까지 대기