import 'package:get/get.dart';
import 'package:flutter_blog_app/model/post/post.dart';
import 'package:flutter_blog_app/model/post/post_repository.dart';

// view 와 통신
class PostController extends GetxController {

  final PostRepository _postRepository = PostRepository();
  final posts = <Post>[].obs;
  final post = Post().obs;

  @override
  void onInit() {
    super.onInit();
    findAll();
  }

  Future<void> findAll() async {
    List<Post> posts = await _postRepository.findAll();
    this.posts.value = posts;
  }

  Future<void> findById(int id) async {
    Post post = await _postRepository.findById(id);
    this.post.value = post;
  }

  Future<void> deleteById(int id) async {
    int result = await _postRepository.deleteById(id);
    if (result == 1) {
      print("서버 쪽 삭제 성공");
      List<Post> newPosts = this.posts.value.where((post) => post.id != id).toList();
      this.posts.value = newPosts;
    }
  }

  Future<void> updateById(int id, String title, String content) async {
    Post? post = await _postRepository.updateById(id, title, content);
    if (post != null) {
      this.post.value = post;
      List<Post> newPosts = this.posts.map(
              (e) => e.id == id ? post : e
      ).toList();
      this.posts.value = newPosts;
    }
  }

  Future<void> save(String title, String content) async {
    Post? post = await _postRepository.save(title, content);
    if (post != null) {
      this.posts.add(post);
    }
  }
}
