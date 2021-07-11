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
            Row(
              mainAxisAlignment: MainAxisAlignment.center, // 주축 정렬
              children: [
                Expanded(child: Image.asset('image/dice1.png')), // Expanded has flex field, too
                Expanded(child: Image.asset('image/dice2.png')),
              ],
            )
          ],
        )
      ),
    );
  }
}
