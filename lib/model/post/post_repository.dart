import 'package:get/get.dart';
import 'package:flutter_blog_app/controller/dto/CMRespDto.dart';
import 'package:flutter_blog_app/controller/dto/SaveOrUpdatePostReqDto.dart';
import 'package:flutter_blog_app/model/post/post.dart';
import 'package:flutter_blog_app/model/post/post_provider.dart';

// 통신을 호출해서 응답되는 데이터를 에쁘게 가공! (json -> Dart object)
class PostRepository {

  final PostProvider _postProvider = PostProvider();

  Future<List<Post>> findAll() async {
    Response response = await _postProvider.findAll();
    CMRespDto cmRespDto = CMRespDto.fromJson(response.body);

    if(cmRespDto.code == 1) {
      List<dynamic> temp = cmRespDto.data;
      List<Post> posts = temp.map(
              (post) => Post.fromJson(post)
      ).toList();
      return posts;

    } else {
      return <Post>[]; // 빈 배열 리턴
    }
  }

  Future<Post> findById(int id) async {
    Response response = await _postProvider.findById(id);
    CMRespDto cmRespDto = CMRespDto.fromJson(response.body);

    if(cmRespDto.code == 1) {
      return Post.fromJson(cmRespDto.data);
    } else {
      return Post();
    }
  }

  Future<int> deleteById(int id) async {
    Response response = await _postProvider.deleteById(id);
    CMRespDto cmRespDto = CMRespDto.fromJson(response.body);
    return cmRespDto.code ?? -1;
  }

  Future<Post?> updateById(int id, String title, String content) async {
    SaveOrUpdatePostReqDto updatePostReqDto = SaveOrUpdatePostReqDto(title, content);
    Response response = await _postProvider.updateById(id, updatePostReqDto.toJson());
    CMRespDto cmRespDto = CMRespDto.fromJson(response.body);

    if (cmRespDto.code == 1) {
      print("수정 성공");
      return Post.fromJson(cmRespDto.data);

    } else {
      print("수정 실패");
      return null;
    }
  }

  Future<Post?> save(String title, String content) async {
    SaveOrUpdatePostReqDto savePostReqDto = SaveOrUpdatePostReqDto(title, content);
    Response response = await _postProvider.save(savePostReqDto.toJson());
    CMRespDto cmRespDto = CMRespDto.fromJson(response.body);

    print(cmRespDto.data);

    if (cmRespDto.code == 1) {
      print("글쓰기 성공");
      return Post.fromJson(cmRespDto.data);

    } else {
      print("글쓰기 실패");
      return null;
    }
  }

}