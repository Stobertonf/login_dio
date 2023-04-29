import 'package:flutter/material.dart';
import 'package:login_dio_flutter/models/characters_model.dart';
import 'package:login_dio_flutter/repositories/marvel/marvel_repository.dart';

class CharactersPage extends StatefulWidget {
  const CharactersPage({super.key});

  @override
  State<CharactersPage> createState() => _CharactersPagePageState();
}

class _CharactersPagePageState extends State<CharactersPage> {
  int offset = 0;
  var carregando = false;
  late MarvelRepository marvelRepository;
  CharactersModel characters = CharactersModel();
  ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    _scrollController.addListener(() {
      var posicaoParaPaginar = _scrollController.position.maxScrollExtent * 0.7;
      if (_scrollController.position.pixels > posicaoParaPaginar) {
        print("Carregando página");
        //Função que vai carregar os dados
      }
    });
    marvelRepository = MarvelRepository();
    super.initState();
    //Função que vai carregar os dados
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text(
        'Heróis da Marvel',
      ),
    );
  }
}
