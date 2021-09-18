import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_blog_app/controller/user_controller.dart';
import 'package:flutter_blog_app/model/user/user_repository.dart';
import 'package:flutter_blog_app/util/validator_util.dart';
import 'package:flutter_blog_app/view/components/custom_elevated_button.dart';
import 'package:flutter_blog_app/view/components/custom_text_form_field.dart';
import 'package:flutter_blog_app/view/pages/post/home_page.dart';
import 'package:flutter_blog_app/view/pages/user/join_page.dart';

class LoginPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final UserController u = Get.put(UserController());

  final _username = TextEditingController();
  final _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Container(
            alignment: Alignment.center,
            height: 200,
            child: Text(
              "로그인 화면 ${u.isLogin}",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          _loginForm(),
        ],
      ),
    );
  }

  Widget _loginForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
            controller: _username,
            hint: "Username",
            funValidator: validateUsername(),
          ),
          CustomTextFormField(
            controller: _password,
            hint: "Password",
            funValidator: validatePassword(),
          ),
          CustomElevatedButton(
            text: "로그인",
            funPageRoute: () async {
              if (_formKey.currentState!.validate()) {
                int result = await u.login(_username.text.trim(), _password.text.trim());
                if (result == 1) {
                  Get.to(() => HomePage());
                  print("토큰 받음");
                } else {
                  print("토큰 없음");
                  Get.snackbar("로그인 시도", "로그인 실패");
                }
              }
            },
          ),
          TextButton(
            onPressed: () {
              Get.off(JoinPage());
            },
            child: Text("아직 회원가입이 안되어 있나요?"),
          ),
        ],
      ),
    );
  }
}
