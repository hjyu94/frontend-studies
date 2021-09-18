import 'package:get/get.dart';
import 'package:flutter_blog_app/model/user/user.dart';
import 'package:flutter_blog_app/model/user/user_repository.dart';
import 'package:flutter_blog_app/util/jwt.dart';

// view 와 통신
class UserController extends GetxController {

  final UserRepository _userRepository = UserRepository();
  final RxBool isLogin = false.obs;
  // Rx, obs ? 관찰 가능한 변수 => 이후 변경되면 UI 가 자동 업데이트
  final principal = User().obs;

  void logout() {
    isLogin.value = false;
    jwtToken = null;
    // GET storage (shared preference)
  }

  Future<int> login(String username, String password) async {
    User principal = await _userRepository.login(username, password);

    if (principal.id != null) {
      this.principal.value = principal;
      isLogin.value = true;
      return 1;

    } else {
      return -1;
    }

  }

}