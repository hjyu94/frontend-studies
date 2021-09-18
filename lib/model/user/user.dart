import 'package:intl/intl.dart';

class User {

  final int? id;
  final String? username;
  final String? email;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  User({
    this.id,
    this.username,
    this.email,
    this.createdAt,
    this.updatedAt,
  });

  User.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        username = json["username"],
        email = json["email"],
        createdAt = DateFormat("yyyy-mm-dd").parse(json["created"]),
        updatedAt = DateFormat("yyyy-mm-dd").parse(json["updated"]);

}
