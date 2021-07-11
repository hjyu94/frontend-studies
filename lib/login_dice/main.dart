import 'package:flutter/material.dart';

import 'dice.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // ?
      title: 'Dice game',
      home: LogIn(),
    );
  }
}

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {

  TextEditingController controller = TextEditingController();
  TextEditingController controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log in'),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
        leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: (){}
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPressed: (){}
          )
        ],
      ),
      body: Builder(
        builder: (context) {
          return GestureDetector(
            /*
              onPressed - 주로 버튼과 관련된 이벤트 처리 콜백
              onTap - 버튼을 포함한 다양한 이벤트 (길게 누르기, 연속 두번 누르기, 드래그하기)

              focus node - 포커스를 받는 특정 위젯을 식별
              focus scope - 어떤 위젯들까지 포커스를 받는지 범위를 나타냄
             */
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: SingleChildScrollView( // 키보드가 올라와서 화면을 가릴 수 있음, 키보드가 올라온 영역 만큼 스크롤 해주는 위젯
              child: Column(
                children: [
                  Center(
                    child: Image(
                      image: AssetImage('image/chef.gif'),
                      width: 170.0,
                      height: 190.0,
                    )
                  ),
                  Form(
                    child: Theme(
                      data: ThemeData(
                        primaryColor: Colors.teal,
                        inputDecorationTheme: InputDecorationTheme(
                          labelStyle: TextStyle(
                            color: Colors.teal,
                            fontSize: 15.0,
                          )
                        )
                      ),
                      child: Container(
                        padding: EdgeInsets.all(40.0),
                        child: Column(
                          children: <Widget>[
                            TextField(
                              controller: controller,
                              decoration: InputDecoration(
                                labelText: 'Enter "dice"',
                              ),
                              keyboardType: TextInputType.emailAddress,
                            ),
                            TextField(
                              controller: controller2,
                              decoration: InputDecoration(
                                labelText: 'Enter Password',
                              ),
                              keyboardType: TextInputType.text,
                              obscureText: true,
                            ),
                            SizedBox(height: 40.0), // blank between text field and button theme
                            ButtonTheme(
                              minWidth: 100.0,
                              height: 50.0,
                              child: ElevatedButton(
                                onPressed: () {
                                  if(controller.text == 'dice' && controller2.text == '1234') {
                                    Navigator.push(context, MaterialPageRoute(
                                      builder: (BuildContext context) => Dice()
                                    ));
                                  } else if(controller.text == 'dice' && controller2.text != '1234') {
                                    showSnackBar(context, '비밀번호가 일치하지 않습니다');
                                  } else if(controller.text != 'dice' && controller2.text == '1234') {
                                    showSnackBar(context, 'dice 철자를 확인하세요');
                                  } else {
                                    showSnackBar(context, '로그인 정보를 확인하세요');
                                  }
                                },
                                child: Icon(Icons.arrow_forward,
                                  color: Colors.white,
                                  size: 35.0,
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.orangeAccent,
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    )
                  )
                ],
              ),
            ),
          );
        }
      )
    );
  }
}

void showSnackBar(BuildContext context, String msg) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(msg,
      textAlign: TextAlign.center,
    ),
    duration: Duration(seconds: 2),
    backgroundColor: Colors.blue,
  ));
}