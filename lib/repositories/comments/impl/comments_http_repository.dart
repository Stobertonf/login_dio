
import 'package:login_dio_flutter/models/comment_model.dart';
import 'package:login_dio_flutter/repositories/jsonplaceholder_custon_dio.dart';
import 'package:login_dio_flutter/repositories/comments/comments_repository.dart';


class CommentsDioRepsositoy implements CommentsRepository {
  @override
  Future<List<CommentModel>> retornaComentarios(int postId) async {
    var jsonPlaceHolderCustonDio = JsonPlaceHolderCustonDio();
    var response =
        await jsonPlaceHolderCustonDio.dio.get("/posts/$postId/comments");
    return (response.data as List)
        .map((e) => CommentModel.fromJson(e))
        .toList();
  }
}