import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login app',
      theme: ThemeData(primarySwatch: Colors.grey),
      home: LogIn(),
    );
  }
}

class LogIn extends StatelessWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Sign In',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0.2,
      ),
      body: Padding( // 화면 가장자리로부터 16 pixel
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // 세로 중앙 위치시키기
          children: [
            ButtonTheme( // 세로 높이를 지정해 주기 위함
              height: 50.0,
              child: ElevatedButton(
                onPressed: () {  },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly, // children 사이 간격이 균등하도록 함
                  children: [
                    Icon(Icons.account_balance_sharp),
                    Text('Login with Google',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 15.0
                      ),
                    ),
                    Opacity( // Text 를 가운데 정렬하기 위해서 보이지 않는 위젯을 추가해 놓음
                      opacity: 0.0,
                      child: Icon(Icons.account_balance_sharp),
                    ),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white, // backgroundColor
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(4.0),
                )
              ),
            ),
            ButtonTheme( // 세로 높이를 지정해 주기 위함
              height: 50.0,
              child: ElevatedButton(
                onPressed: () {  },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly, // children 사이 간격이 균등하도록 함
                  children: [
                    Icon(Icons.facebook, color: Colors.white),
                    Text('Login with Facebook',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0
                      ),
                    ),
                    Opacity( // Text 를 가운데 정렬하기 위해서 보이지 않는 위젯을 추가해 놓음
                      opacity: 0.0,
                      child: Icon(Icons.facebook),
                    ),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blueAccent, // backgroundColor
                ),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(4.0),
                  )
              ),
            ),
            ButtonTheme( // 세로 높이를 지정해 주기 위함
              height: 50.0,
              child: ElevatedButton(
                onPressed: () {  },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly, // children 사이 간격이 균등하도록 함
                  children: [
                    Icon(Icons.email, color: Colors.white),
                    Text('Login with Email',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0
                      ),
                    ),
                    Opacity( // Text 를 가운데 정렬하기 위해서 보이지 않는 위젯을 추가해 놓음
                      opacity: 0.0,
                      child: Icon(Icons.email),
                    ),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.green[700], // backgroundColor
                ),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(4.0),
                  )
              ),
            ),
          ],
        )
      )
    );
  }
}
