import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Center(
        child: RaisedButton(
          child: Text('Go to ScreenA'),
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ScreenA())),
        )
      )
    );
  }
}

class ScreenA extends StatelessWidget {
  const ScreenA({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Hi, there!')
      )
    );
  }
}
