import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_blog_app/view/components/custom_elevated_button.dart';
import 'package:flutter_blog_app/view/components/custom_text_form_field.dart';
import 'package:flutter_blog_app/view/pages/user/login_page.dart';
import 'package:flutter_blog_app/util/validator_util.dart';
import 'package:validators/validators.dart';

class JoinPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Container(
              alignment: Alignment.center,
              height: 200,
              child: Text("회원가입 화면",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold))),
          _joinForm()
        ],
      ),
    );
  }

  Widget _joinForm() {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            CustomTextFormField(
              hint: "Username",
              funValidator: validateUsername(),
            ),
            CustomTextFormField(
              hint: "Password",
              funValidator: validatePassword(),
            ),
            CustomTextFormField(
              hint: "Email",
              funValidator: validateEmail(),
            ),
            CustomElevatedButton(
              text: "회원가입",
              funPageRoute: () {
                if (_formKey.currentState!.validate()) {
                  Get.to(LoginPage());
                }
              },
            ),
            TextButton(
              onPressed: () {
                Get.off(LoginPage());
              },
              child: Text("이미 회원가입어 되어 있나요?"),
            ),
          ],
        ));
  }
}
