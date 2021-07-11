/*
  Buttons
    - RaisedButton -> ElevatedButton
    - FlatButton -> TextButton
    - OutlineButotn -> OutlinedButton
 */

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyButtons(),
    );
  }
}

class MyButtons extends StatelessWidget {
  const MyButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Buttons'),
          centerTitle: true,
        ),
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          TextButton(
            onPressed: () {
              print('text button');
            },
            onLongPress: () {
              print('long press');
            },
            child: Text(
              'Text button',
              style: TextStyle(fontSize: 20.0),
            ),
            style: TextButton.styleFrom(
              primary: Colors.red,
              backgroundColor: Colors.grey[100],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              print('Elevated button');
            },
            child: Text('Elevated Button'),
            style: ElevatedButton.styleFrom(
                primary: Colors.orangeAccent[100], // backgroundColor
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                elevation: 0.0),
          ),
          OutlinedButton(
            onPressed: () {
              print('Outlined Button');
            },
            child: Text('Outlined Button'),
            style: OutlinedButton.styleFrom(
                primary: Colors.green,
                side: BorderSide(color: Colors.black26, width: 2.0)),
          ),
          TextButton.icon(
              onPressed: () {
                print('Icon button');
              },
              icon: Icon(
                Icons.home,
                size: 30.0,
                color: Colors.black45,
              ),
              label: Text('Go to home'),
              style: TextButton.styleFrom(
                  primary: Colors
                      .purple // icon 에서 색상을 지정하지 않으면 primary 색의 아이콘이 지정된다.
                  )),
          ElevatedButton.icon(
              onPressed: () {
                print('Icon button');
              },
              icon: Icon(
                Icons.home,
                size: 20.0,
              ),
              label: Text('Go to home'),
              style: TextButton.styleFrom(
                primary: Colors.black,
                // icon 에서 색상을 지정하지 않으면 primary 색의 아이콘이 지정된다.
                minimumSize: Size(200, 50),
              )),
          OutlinedButton.icon(
              onPressed: null, // 버트 비활성화
              icon: Icon(
                Icons.home,
              ),
              label: Text('Go to home'),
              style: TextButton.styleFrom(
                primary: Colors.black,
                // icon 에서 색상을 지정하지 않으면 primary 색의 아이콘이 지정된다.
                onSurface: Colors.pink, // 버튼 비활성화 색상
              )),
          // 버튼들 정렬하기
          ButtonBar(
            children: [
              TextButton(onPressed: () {}, child: Text('Text Button')),
              ElevatedButton(onPressed: () {}, child: Text('elevated Button')),
            ],
            alignment: MainAxisAlignment.center,
            buttonPadding: EdgeInsets.all(20),
          )
        ])));
  }
}
