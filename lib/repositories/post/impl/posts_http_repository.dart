import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:login_dio_flutter/models/post_model.dart';
import 'package:login_dio_flutter/repositories/post/posts_repository.dart';

class PostsHttpRepository implements PostsRepository {
  @override
  Future<List<PostModel>> getPosts() async {
    var response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    if (response.statusCode == 200) {
      var jsonPosts = jsonDecode(response.body);
      return (jsonPosts as List).map((e) => PostModel.fromJson(e)).toList();
    } else {
      return [];
    }
  }
}