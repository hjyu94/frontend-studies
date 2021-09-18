import 'package:intl/intl.dart';
import 'package:flutter_blog_app/model/user/user.dart';

class Post {

  final int? id;
  final String? title;
  final String? content;
  final User? user;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Post({
    this.id,
    this.title,
    this.content,
    this.user,
    this.createdAt,
    this.updatedAt,
  });

  Post.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        title = json["title"],
        content = json["content"],
        user = User.fromJson(json["user"]),
        createdAt = DateFormat("yyyy-mm-dd").parse(json["created"]),
        updatedAt = DateFormat("yyyy-mm-dd").parse(json["updated"]);

}
