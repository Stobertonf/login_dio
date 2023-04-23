

import 'package:login_dio_flutter/models/comment_model.dart';

abstract class CommentsRepository {
  Future<List<CommentModel>> retornaComentarios(int postId);
}