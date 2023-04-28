import 'package:login_dio_flutter/models/post_model.dart';

abstract class PostsRepository {
  Future<List<PostModel>> getPosts();
}