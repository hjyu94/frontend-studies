import 'package:get/get.dart';
import 'package:flutter_blog_app/controller/dto/CMRespDto.dart';
import 'package:flutter_blog_app/controller/dto/LoginReqDto.dart';
import 'package:flutter_blog_app/model/user/user.dart';
import 'package:flutter_blog_app/model/user/user_provider.dart';
import 'package:flutter_blog_app/util/jwt.dart';

// 통신을 호출해서 응답되는 데이터를 에쁘게 가공! (json -> Dart object)
class UserRepository {

  final UserProvider _userProvider = UserProvider();

  Future<User> login(String username, String password) async {
    LoginReqDto loginReqDto = LoginReqDto(username, password);
    print(loginReqDto.toJson());

    Response response = await _userProvider.login(loginReqDto.toJson());
    print(response.body);

    CMRespDto cmRespDto = CMRespDto.fromJson(response.body);
    if (cmRespDto.code == 1) {
      User principal = User.fromJson(cmRespDto.data);
      jwtToken = response.headers?["authorization"];
      print("jwt-token: $jwtToken");
      return principal;

    } else {
      return User();
    }
  }

}