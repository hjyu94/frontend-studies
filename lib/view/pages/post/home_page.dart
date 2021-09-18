import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_blog_app/controller/post_controller.dart';
import 'package:flutter_blog_app/controller/user_controller.dart';
import 'package:flutter_blog_app/size.dart';
import 'package:flutter_blog_app/util/jwt.dart';
import 'package:flutter_blog_app/view/pages/post/detail_page.dart';
import 'package:flutter_blog_app/view/pages/post/write_page.dart';
import 'package:flutter_blog_app/view/pages/user/login_page.dart';
import 'package:flutter_blog_app/view/pages/user/user_info.dart';

class HomePage extends StatelessWidget {
  var refreshKey = GlobalKey<RefreshIndicatorState>();
  var scaffoldKey = GlobalKey<ScaffoldState>();

  UserController u = Get.find();
  PostController p = Get.put(PostController());

  // put 은 없으면 만들고, 있으면 찾기!

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if(scaffoldKey.currentState!.isDrawerOpen) {
            scaffoldKey.currentState!.openEndDrawer();
          } else {
            scaffoldKey.currentState!.openDrawer();
          }
        },
        child: Icon(Icons.code),
      ),
      drawer: _navigation(context),
      appBar: AppBar(
        title: Text("${u.isLogin}"),
        // title: Obx(() => Text("${u.isLogin}")), // 이래야 ui 가 변경됨
      ),
      body: Obx(
        () => RefreshIndicator(
          key: refreshKey,
          onRefresh: () async {
            await p.findAll();
          },
          child: ListView.separated(
            itemCount: p.posts.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () async {
                  await p.findById(p.posts[index].id!);
                  Get.to(() => DetailPage(p.posts[index].id), arguments: "안");
                },
                title: Text("${p.posts[index].title}"),
                leading: Text("${p.posts[index].id}"),
              );
            },
            separatorBuilder: (context, index) {
              return Divider();
            },
          ),
        ),
      ),
    );
  }

  Widget _navigation(BuildContext context) {
    return Container(
      width: getDrawerWidth(context),
      height: double.infinity,
      color: Colors.white,
      child: SafeArea(
        // 너무 위에 있어서
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton(
                onPressed: () {
                  Get.to(() => WritePage());
                },
                child: Text(
                  "글쓰기",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                )),
            Divider(),
            TextButton(
                onPressed: () {
                  // Navigator.pop(context); // 제일 위에 쌓인 화면을 날린다
                  scaffoldKey.currentState!.openEndDrawer(); // 이 방법도 있다.
                  Get.to(() => UserInfoPage());
                },
                child: Text(
                  "회원 정보 보기",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                )),
            Divider(),
            TextButton(
                onPressed: () {
                  u.logout();
                  Get.to(() => LoginPage());
                },
                child: Text(
                  "로그아웃",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
