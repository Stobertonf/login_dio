import 'package:hive/hive.dart';
import 'package:login_dio_flutter/models/dados_cadastrais_model.dart';

class DadosCadastraisRepository {
  static late Box _box;

  DadosCadastraisRepository._criar();

  static Future<DadosCadastraisRepository> carregar() async {
    if (Hive.isBoxOpen('dadosCadastraisModel')) {
      _box = Hive.box('dadosCadastraisModel');
    } else {
      _box = await Hive.openBox('dadosCadastraisModel');
    }
    return DadosCadastraisRepository._criar();
  }

  salvar(DadosCadastraisModel dadosCadastraisModel) {
    _box.put('dadosCadastraisModel', dadosCadastraisModel);
  }

}