

import 'package:hive/hive.dart';
import 'package:login_dio_flutter/models/configuration_model.dart';

class ConfigurationRepository{
  static late Box _box;

  ConfigurationRepository._criar();

  static Future<ConfigurationRepository> carregar() async {
    if (Hive.isBoxOpen('configuracoes')) {
      _box = Hive.box('configuracoes');
    } else {
      _box = await Hive.openBox('configuracoes');
    }
    return ConfigurationRepository._criar();
  }

  void salvar(ConfigurantionModel configurationModel) {
    _box.put('configuracoesModel', {
      'nomeUsuario': configurationModel.nomeUsuario,
      'altura': configurationModel.altura,
      'receberNotificacoes': configurationModel.receberNotificacoes,
      'temaEscuro': configurationModel.temaEscuro
    });
  }

  ConfigurantionModel obterDados() {
    var configuracoes = _box.get('configuracoesModel');
    if (configuracoes == null) {
      return ConfigurantionModel.vazio();
    }
    return ConfigurantionModel(
        configuracoes["nomeUsuario"],
        configuracoes["altura"],
        configuracoes["receberNotificacoes"],
        configuracoes["temaEscuro"]);
  }
}