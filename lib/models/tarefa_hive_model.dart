import 'package:hive/hive.dart';

@HiveType(typeId: 1)
class TarefaHiveModel extends HiveObject {
  @HiveField(0)
  String descricao = "";

  @HiveField(1)
  bool concluido = false;

  TarefaHiveModel();

  TarefaHiveModel.criar(this.descricao, this.concluido);
}
