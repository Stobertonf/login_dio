import 'package:flutter/material.dart';
import 'package:login_dio_flutter/pages/lists/list_view.dart';
import 'package:login_dio_flutter/pages/tasks/tasks_page.dart';
import 'package:login_dio_flutter/pages/lists/list_view_horizontal.dart';
import 'package:login_dio_flutter/pages/registration/image_assets.dart';


class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}


class _MainPageState extends State<MainPage> {
  PageController controller = PageController(initialPage: 0);
  int posicaoPagina = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Main Page"),
        ),
        drawer: Drawer(
          child: Padding(
            padding: const  EdgeInsets.symmetric(vertical: 20, horizontal: 10,),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  child: Container(
                      padding:const EdgeInsets.symmetric(vertical: 5,),
                      width: double.infinity,
                      child:const Text("Dados cadastráis",),),
                  onTap: () {
                    //Tem que ser antes pra remover a tela e fazer o push.
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MainPage(
                                 
                                ),),);
                  },
                ),
                const Divider(),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      width: double.infinity,
                      child:const Text("Termos & Conditions",),),
                  onTap: () {},
                ),
                const Divider(),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      width: double.infinity,
                      child: const Text(
                        "Settings",
                          style: TextStyle(
                             fontSize: 20,
                            color: Colors.black,
                        ),
                      ),),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: PageView(
                controller: controller,
                onPageChanged: (value) {
                  setState(() {
                    posicaoPagina = value;
                  });
                },
                children:  const [
                  ImageAssetsPage(),
                  ListViewPage(),
                  ListViewHorizontal(),
                  TaskPage()
                ],
              ),
            ),
             BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                onTap: (value) {
                  controller.jumpToPage(value);
                },
                currentIndex: posicaoPagina,
                items: const [
                  BottomNavigationBarItem(
                      label: "Home", icon: Icon(Icons.home)),
                  BottomNavigationBarItem(label: "Users", icon: Icon(Icons.person)),
                  BottomNavigationBarItem(
                      label: "Photos", icon: Icon(Icons.camera)),
                  BottomNavigationBarItem(
                      label: "Pag4", icon: Icon(Icons.image)),
                  BottomNavigationBarItem(
                      label: "Tasks", icon: Icon(Icons.list))
                ]),
          ],
        ),
      ),
    );
  }
}