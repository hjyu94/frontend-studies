/// https://dart.dev/codelabs/async-await

import 'dart:io'; // socket, http 서버와 통신에 필요한 라이브러리

void main() {
  showData();
}

void showData() {
  startTask();
  accessData();
  fetchData();
}

void startTask() {
  String info = '요청수행 시작';
  print(info);
}

void accessData() {
  Duration time = Duration(seconds: 3);

  if(time.inSeconds > 2) {
    // sleep(time);

    /// delayed(Duration duration, FutureOr<T> computation())
    /// -> 함수 형태 (){}
    /// time 만큼 지체 된 후 computation 을 호출한다
    Future.delayed(time, (){
      String info = '데이터에 처리 완료';
      print(info);
    });

  } else {
    String info = '데이터에 접속중';
    print(info);
  }
}

void fetchData() {
  String info = '잔액은 1,000원 입니다';
  print(info);
}

/// future() 는 제네릭 처럼 원하는 함수 리턴형을 지정해 줄 수 있다.
///
/// In the following example,
/// fetchUserOrder() returns a future that completes after printing to the console.
/// Because it doesn’t return a usable value, fetchUserOrder() has the type Future<void>.
Future<void> fetchUserOrder() {
  // Imagine that this function is fetching user info from another service or database.
  return Future.delayed(const Duration(seconds: 2), () => print('Large Latte'));
}