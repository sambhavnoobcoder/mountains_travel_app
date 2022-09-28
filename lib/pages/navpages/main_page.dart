import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:good_app/pages/navpages/bar_item_page.dart';
import 'package:good_app/pages/home_page.dart';
import 'package:good_app/pages/navpages/my_page.dart';
import 'package:good_app/pages/navpages/search_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages=[
    HomePage(),
    BarItemPage(),
    SearchPage(),
    MyPage(),
  ];
  int cindex=0;
  void ontap(int index)
  {
    setState(() {
      cindex=index;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: pages[cindex],
      backgroundColor: Colors.white,
      bottomNavigationBar:BottomNavigationBar(
        unselectedFontSize: 0,
        selectedFontSize: 0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        onTap: ontap,
        currentIndex: cindex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        items: [
          BottomNavigationBarItem(label:"Home",icon: Icon(Icons.apps)),
          BottomNavigationBarItem(label:"Bar",icon: Icon(Icons.bar_chart_sharp)),
          BottomNavigationBarItem(label:"Search",icon: Icon(Icons.search)),
          BottomNavigationBarItem(label:"Profile",icon: Icon(Icons.person)),
        ],
      ),
    );
  }
}
