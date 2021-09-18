import 'package:get/get.dart';
import 'package:flutter_blog_app/util/jwt.dart';

const host = "http://192.168.123.106:8080";

// 서버와 통신
class PostProvider extends GetConnect {
  // header 가 없으면 get 요청을 보낼 수 없음
  Future<Response> findAll() =>
      get("$host/post", headers: {"Authorization": jwtToken ?? ""});

  Future<Response> findById(int id) =>
      get("$host/post/$id", headers: {"Authorization": jwtToken ?? ""});

  Future<Response> deleteById(int id) =>
      delete("$host/post/$id", headers: {"Authorization": jwtToken ?? ""});

  Future<Response> updateById(int id, Map data) =>
      put("$host/post/$id", data, headers: {"Authorization": jwtToken ?? ""});

  Future<Response> save(Map data) =>
      post("$host/post", data, headers: {"Authorization": jwtToken ?? ""});
}
