import 'package:login_dio_flutter/models/post_model.dart';
import 'package:login_dio_flutter/repositories/http/posts/posts_repository.dart';
import 'package:login_dio_flutter/repositories/jsonplaceholder_custon_dio.dart';

class PostsDioRepository implements PostsRepository {
  @override
  Future<List<PostModel>> getPosts() async {
    var jsonPlaceHolderCustonDio = JsonPlaceHolderCustonDio();
    var response = await jsonPlaceHolderCustonDio.dio.get("/posts");
    if (response.statusCode == 200) {
      return (response.data as List).map((e) => PostModel.fromJson(e)).toList();
    } else {
      return [];
    }
  }
}