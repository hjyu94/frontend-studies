import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_blog_app/controller/post_controller.dart';
import 'package:flutter_blog_app/controller/user_controller.dart';
import 'package:flutter_blog_app/view/pages/post/update_page.dart';

import 'home_page.dart';

class DetailPage extends StatelessWidget {
  final int? id;

  const DetailPage(this.id);

  @override
  Widget build(BuildContext context) {
    UserController u = Get.find();
    PostController p = Get.find();
    print("u.principal.value.id: ${u.principal.value.id}");
    print("p.post.value.user!.id: ${p.post.value.user!.id}");

    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${p.post.value.title}",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
                ),
                Divider(),
                u.principal.value.id == p.post.value.user!.id ? Row (
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        p.deleteById(p.post.value.id!);
                        Get.off(() => HomePage());
                      },
                      child: Text("삭제"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Get.to(() => UpdatePage());
                      },
                      child: Text("수정"),
                    ),
                  ],
                ) : SizedBox(),
                Expanded(
                  child: SingleChildScrollView(
                    child: Text(
                      "${p.post.value.content}",
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
