

import 'package:login_dio_flutter/models/task_sqlite.dart';
import 'package:login_dio_flutter/repositories/sqlite/sqlitedatabase.dart';

class TaskSQLiteRepository {
  Future<List<TaskSQLiteModel>> obterDados(bool apenasNaoConcluidos) async {
    List<TaskSQLiteModel> task = [];
    var db = await SQLiteDataBase().getDataBase();
    var result = await db.rawQuery(apenasNaoConcluidos
        ? "SELECT id, descricao, concluido FROM task WHERE concluido = 0"
        : 'SELECT id, descricao, concluido FROM task');
    for (var element in result) {
      task.add(TaskSQLiteModel(int.parse(element["id"].toString()),
          element["descricao"].toString(), element["concluido"] == 1));
    }
    return task;
  }

  Future<void> save(TaskSQLiteModel taskSQLiteModel) async {
    var db = await SQLiteDataBase().getDataBase();
    await db.rawInsert('INSERT INTO task (descricao, concluido) values(?,?)',
        [taskSQLiteModel.descricao, taskSQLiteModel.concluido]);
  }

  Future<void> update(TaskSQLiteModel taskSQLiteModel) async {
    var db = await SQLiteDataBase().getDataBase();
    await db.rawInsert(
        'UPDATE task SET descricao = ?, concluido = ? WHERE id = ?', [
      taskSQLiteModel.descricao,
      taskSQLiteModel.concluido ? 1 : 0,
      taskSQLiteModel.id
    ]);
  }

  Future<void> delete(int id) async {
    var db = await SQLiteDataBase().getDataBase();
    await db.rawInsert('DELETE FROM task WHERE id = ?', [id]);
  }
}