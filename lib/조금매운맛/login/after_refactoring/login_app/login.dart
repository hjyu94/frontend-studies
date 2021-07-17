
import 'package:coding_chef_easy/%EC%A1%B0%EA%B8%88%EB%A7%A4%EC%9A%B4%EB%A7%9B/login/after_refactoring/my_button/my_button.dart';
import 'package:flutter/material.dart';

class LogIn extends StatelessWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Sign In',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0.2,
      ),
      body: buildButton(),
    );
  }

  Widget buildButton() {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MyButton(
            onPressed: () {  },
            icon: Icon(Icons.account_balance_sharp, color: Colors.black87),
            text: Text('Login with Google',
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 15.0
              ),
            ),
            color: Colors.white,
            radius: 4.0,
          ),
          MyButton(
            onPressed: () {  },
            icon: Icon(Icons.facebook, color: Colors.white),
            text: Text('Login with Facebook',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.0
              ),
            ),
            color: Colors.blueAccent,
            radius: 4.0,
          ),
          MyButton(
            onPressed: () {  },
            icon: Icon(Icons.email, color: Colors.white),
            text: Text('Login with Email',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.0
              ),
            ),
            color: Colors.green,
            radius: 4.0,
          ),
        ],
      ),
    );
  }
}
