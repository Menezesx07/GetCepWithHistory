import 'package:flutter/material.dart';
import 'package:viacepback4app/pages/ListView/list_page.dart';
import 'package:viacepback4app/pages/ListView/search_page.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {

  int pagePosition = 0;

  PageController controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text('CEP Back4App'),
      ),

      body: Column(
        children: [

          Expanded(
            child: PageView(
              controller: controller,
              onPageChanged: (value) {
                setState(() {
                  pagePosition = value;
                });
              },
              children: const [
                searchPage(),
                listPage()
              ],
            ),
          ),

          BottomNavigationBar(
            //tem de colocar o type, pois apartir de 4 itens, ele quebra
              type: BottomNavigationBarType.fixed,

              onTap: (value) => controller.jumpToPage(value),
              currentIndex: pagePosition,
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
                BottomNavigationBarItem(icon: Icon(Icons.list_rounded), label: "List"),
              ])
        ],
      ),
    );
  }
}
