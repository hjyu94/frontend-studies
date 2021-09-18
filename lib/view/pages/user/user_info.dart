import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_blog_app/controller/user_controller.dart';

class UserInfoPage extends StatelessWidget {
  UserController u = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("회원 번호: ${u.principal.value.id}"),
            Text("회원 이름: ${u.principal.value.username}"),
            Text("회원 이메일: ${u.principal.value.email}"),
            Text("회원 가입 날짜: ${u.principal.value.createdAt}"),
          ],
        ),
      ),
    );
  }
}
