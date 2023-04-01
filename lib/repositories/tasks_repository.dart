import 'package:login_dio_flutter/models/task.dart';

class TasksRepository {
  final List<Task> _tasks = [];

  Future<void> add(Task tarefa) async {
    await Future.delayed(const Duration(milliseconds: 100));
    _tasks.add(tarefa);
  }

  Future<void> change(String id, bool concluido) async {
    await Future.delayed(const Duration(milliseconds: 100));
    _tasks.where((tarefa) => tarefa.id == id).first.concluido = concluido;
  }

  Future<void> remove(String id) async {
    await Future.delayed(const Duration(milliseconds: 100));
    _tasks.remove(_tasks.where((tarefa) => tarefa.id == id).first);
  }

  Future<List<Task>> listar() async {
    await Future.delayed(const Duration(milliseconds: 100));
    return _tasks;
  }

  Future<List<Task>> listarNaoConcluidas() async {
    await Future.delayed(const Duration(milliseconds: 100));
    return _tasks.where((tarefa) => !tarefa.concluido).toList();
  }
}