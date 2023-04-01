import 'package:flutter/material.dart';
import 'package:login_dio_flutter/shared/app_images.dart';


class ListViewPage extends StatefulWidget {
  const ListViewPage({Key? key}) : super(key: key);

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: Image.asset(AppImages.user2),
          title: const Text("Usuário 2"),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text("Olá! Tudo bem?"),
              Text("08:59"),
            ],
          ),
          trailing: PopupMenuButton<String>(
            onSelected: (menu) {
              if (menu == "opcao2") {}
            },
            itemBuilder: (BuildContext bc) {
              return <PopupMenuEntry<String>>[
               const PopupMenuItem<String>(value: "opcao1", child: Text("Opção 1")),
               const PopupMenuItem<String>(value: "opcao2", child: Text("Opção 2")),
               const PopupMenuItem<String>(value: "opcao3", child: Text("Opção 3")),
              ];
            },
          ),
        ),
        Image.asset(AppImages.user1),
        Image.asset(AppImages.user2),
        Image.asset(AppImages.user3),
        Image.asset(AppImages.paisagem1),
        Image.asset(AppImages.paisagem2),
        Image.asset(AppImages.paisagem3)
      ],
    );
  }
}