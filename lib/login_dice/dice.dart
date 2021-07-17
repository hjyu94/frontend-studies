import 'package:flutter/material.dart';

class Dice extends StatelessWidget {
  const Dice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text('Dice game'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // 주축 정렬
          children: [
            Padding(
              padding: EdgeInsets.all(32.0),
              child: Row(
                children: [
                  Expanded(child: Image.asset('image/dice1.png')), // Expanded has flex field, too
                  SizedBox(width: 20.0), // blank
                  Expanded(child: Image.asset('image/dice2.png')),
                ],
              ),
            ),
            SizedBox(height: 60.0),
            ButtonTheme(
              minWidth: 100.0,
              height: 60.0,
              child: ElevatedButton(
                onPressed: () {},
                child: Icon(Icons.play_arrow,
                  color: Colors.white,
                  size: 50.0,
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.orangeAccent,
                ),
              ),
            )
          ],
        )
      ),
    );
  }
}
