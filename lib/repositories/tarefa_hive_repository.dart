import 'package:hive/hive.dart';
import 'package:login_dio_flutter/models/task_hive_model.dart';

class TaskHiveRepository {
  static late Box _box;

  TaskHiveRepository._criar();

  static Future<TaskHiveRepository> carregar() async {
    if (Hive.isBoxOpen('dadosCadastraisModel')) {
      _box = Hive.box('dadosCadastraisModel');
    } else {
      _box = await Hive.openBox('dadosCadastraisModel');
    }
    return TaskHiveRepository._criar();
  }

  salvar(TaskHiveModel tarefaHiveModel) {
    _box.add(tarefaHiveModel);
  }

  alterar(TaskHiveModel tarefaHiveModel) {
    tarefaHiveModel.save();
  }

  excluir(TaskHiveModel tarefaHiveModel) {
    tarefaHiveModel.delete();
  }

  List<TaskHiveModel> obterDados(bool naoConcluido) {
    if (naoConcluido) {
      return _box.values
          .cast<TaskHiveModel>()
          .where((element) => !element.concluido)
          .toList();
    }
    return _box.values.cast<TaskHiveModel>().toList();
  }
}