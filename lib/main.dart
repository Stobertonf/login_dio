import 'my_app.dart';
import 'package:hive/hive.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
 //Coloca o alias pra chamar todas ass funções do path_provider.

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var documentDiretory = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(documentDiretory.path); //Inicianddo o Hive
  runApp(const MyApp());
}