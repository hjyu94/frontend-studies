import 'package:flutter/material.dart';

class ScreenB extends StatelessWidget {
  const ScreenB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ScreenB'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text('Go to the ScreenA'),
                onPressed: () {
                  Navigator.pushNamed(context, '/a');
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
