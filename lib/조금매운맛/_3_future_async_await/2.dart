/// 무조건 기다렸다가 실행해야 하는 경우

import 'dart:io';

void main() {
  showData();
}

void showData() {
  startTask();
  String account = accessData();
  fetchData(account);
}

void startTask() {
  String info = '요청수행 시작';
  print(info);
}

String accessData() {
  String account = "";
  Duration time = Duration(seconds: 3);

  if(time.inSeconds > 2) {
    Future.delayed(time, (){
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
