import 'package:hive/hive.dart';
part 'task_hive_model.g.dart';

@HiveType(typeId: 1)
class TaskHiveModel extends HiveObject {
  @HiveField(0)
  String descricao = "";

  @HiveField(1)
  bool concluido = false;

  TaskHiveModel();

  TaskHiveModel.criar(this.descricao, this.concluido);
}