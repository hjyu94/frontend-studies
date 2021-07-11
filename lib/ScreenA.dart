import 'package:flutter/material.dart';

class ScreenA extends StatelessWidget {
  const ScreenA({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ScreenA'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text('Go to the ScreenB'),
                onPressed: () {
                  Navigator.pushNamed(context, '/b');
                },
              ),
              RaisedButton(
                child: Text('Go to the ScreenC'),
                onPressed: () {
                  Navigator.pushNamed(context, '/c');
                },
              )
            ],
          ),
        )
    );
  }
}
