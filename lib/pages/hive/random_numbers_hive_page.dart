

import 'dart:math';
import 'package:hive/hive.dart';
import 'package:flutter/material.dart';
import 'package:login_dio_flutter/services/app_storage_service.dart';

class RandomNumbersHivePage extends StatefulWidget {
  const RandomNumbersHivePage({super.key});

  @override
  State<RandomNumbersHivePage> createState() => _RandomNumbersHivePageState();
}

class _RandomNumbersHivePageState extends State<RandomNumbersHivePage> {


  AppStorageService storage = AppStorageService();

  TextEditingController alturaController = TextEditingController();
  TextEditingController nomeUsuarioController = TextEditingController();

  int numeroGerado = 0;
  int quantidadeCliques = 0;
  late Box boxNumerosAleatorios;

   @override
  void initState() {
    super.initState();
    carregarDados();
  }

    void carregarDados() async {
    if (Hive.isBoxOpen('box_numeros_aleatorios')) {
      boxNumerosAleatorios = Hive.box('box_numeros_aleatorios');
    } else {
      boxNumerosAleatorios = await Hive.openBox('box_numeros_aleatorios');
    }
    numeroGerado = boxNumerosAleatorios.get('numeroGerado') ?? 0;
    quantidadeCliques = boxNumerosAleatorios.get('quantidadeCliques') ?? 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Hive"),
        ),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                numeroGerado == null
                    ? "Nenhum número gerado"
                    : numeroGerado.toString(),
                style: const TextStyle(fontSize: 22),
              ),
              Text(
                quantidadeCliques == null
                    ? "Nenhum clique efetuado"
                    : quantidadeCliques.toString(),
                style:const TextStyle(fontSize: 22),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () async {
            var random = Random();
            setState(() {
              numeroGerado = random.nextInt(1000);
              quantidadeCliques = quantidadeCliques + 1;
            });
            boxNumerosAleatorios.put('numeroGerado', numeroGerado);
            boxNumerosAleatorios.put('quantidadeCliques', quantidadeCliques);
          },
        ),
      ),
    );
  }
}