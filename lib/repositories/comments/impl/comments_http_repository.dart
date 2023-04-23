import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:login_dio_flutter/models/comment_model.dart';
import 'package:login_dio_flutter/repositories/comments/comments_repository.dart';

class CommentsHttpRepository implements CommentsRepository {
  @override
  Future<List<CommentModel>> retornaComentarios(int postId) async {
    var response = await http.get(Uri.parse(
        "https://jsonplaceholder.typicode.com/posts/$postId/comments"));
    if (response.statusCode == 200) {
      var jsonComments = jsonDecode(response.body);
      return (jsonComments as List)
          .map((e) => CommentModel.fromJson(e))
          .toList();
    }
    return [];
  }
}