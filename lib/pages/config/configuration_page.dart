

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:login_dio_flutter/services/app_storage_service.dart';

class ConfigurationPage extends StatefulWidget {
  const ConfigurationPage({super.key});

  @override
  State<ConfigurationPage> createState() => _ConfigurationPageState();
}

class _ConfigurationPageState extends State<ConfigurationPage> {


  AppStorageService storage = AppStorageService();

  TextEditingController alturaController = TextEditingController();
  TextEditingController nomeUsuarioController = TextEditingController();

  double? altura;
  String? nomeUsuario;
  bool temaEscuro = false;
  bool receberNotificacoes  = false;

   @override
  void initState() {
    super.initState();
    carregarDados();
  }

  carregarDados() async {
    nomeUsuarioController.text = await storage.getConfiguracoesNomeUsuario();
    alturaController.text =
        (await (storage.getConfiguracoesAltura())).toString();
    receberNotificacoes = await storage.getConfiguracoesReceberNotificacao();
    temaEscuro = await storage.getConfiguracoesTemaEscuro();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
     
      child: Scaffold(
         appBar: AppBar(
          title:const  Text("Configurações"),
         ),
        body: Container(
          child: ListView(
            children: [
              Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextField(
                      decoration: const InputDecoration(hintText: "Nome usuário"),
                      controller: nomeUsuarioController,
                    ),
                  ),
                  Padding(
                    padding:const  EdgeInsets.symmetric(horizontal: 16),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(hintText: "Altura"),
                      controller: alturaController,
                    ),
                  ),
                SwitchListTile(
                    title: const Text("Receber notificações"),
                    onChanged: (bool value) {
                      setState(() {
                        receberNotificacoes = value;
                      });
                    },
                    value: receberNotificacoes,
                  ),
                  SwitchListTile(
                      title:const Text("Tema escuro"),
                      value: temaEscuro,
                      onChanged: (bool value) {
                        setState(() {
                          temaEscuro = value;
                        });
                      }),

                      TextButton(
                      onPressed: () async {
                        FocusManager.instance.primaryFocus?.unfocus();
                        try {
                          await storage.setConfiguracoesAltura(
                              double.parse(alturaController.text));
                        } catch (e) {
                          showDialog(
                              context: context,
                              builder: (_) {
                                return AlertDialog(
                                  title: const Text("Meu App"),
                                  content:
                                    const  Text("Favor informar uma altura válida!"),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text("Ok"))
                                  ],
                                );
                              });
                          return;
                        }
                        await storage.setConfiguracoesNomeUsuario(
                            nomeUsuarioController.text);
                        await storage.setConfiguracoesReceberNotificacao(
                            receberNotificacoes);
                        await storage.setConfiguracoesTemaEscuro(temaEscuro);
                        Navigator.pop(context);
                      },
                      child: const Text("Salvar"))
            ],
          ),
        ),
      ),
      
    );
  }
}