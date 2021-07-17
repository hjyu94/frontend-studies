import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {

  /// final 변수는 rebuild 될 때 새로운 값이 설정 될 수 있다.
  final Widget icon;
  final Widget text;
  final Color color;
  final double radius;
  final VoidCallback onPressed;

  MyButton({required this.icon, required this.text, required this.color, required this.radius, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ButtonTheme( // 세로 높이를 지정해 주기 위함
      height: 50.0,
      child: ElevatedButton(
        onPressed: this.onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly, // children 사이 간격이 균등하도록 함
          children: [
            this.icon,
            this.text,
            Opacity( // Text 를 가운데 정렬하기 위해서 보이지 않는 위젯을 추가해 놓음
              opacity: 0.0,
              child: this.icon,
            ),
          ],
        ),
        style: ElevatedButton.styleFrom(
          primary: this.color, // backgroundColor
        ),
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(this.radius),
          )
      ),
    );
  }
}
