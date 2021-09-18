import 'package:get/get.dart';

const host = "http://192.168.123.106:8080";

// 서버와 통신
class UserProvider extends GetConnect {

  Future<Response> login(Map data) => post("$host/login", data);

}