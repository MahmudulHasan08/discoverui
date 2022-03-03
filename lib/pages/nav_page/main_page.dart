import 'package:discoverui/pages/nav_page/home_page.dart';
import 'package:discoverui/pages/nav_page/mypage.dart';
import 'package:discoverui/pages/nav_page/search_page.dart';
import 'package:flutter/material.dart';

import 'bar_item_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  void onTap(int index) {
    setState(() {
      selectedItem = index;
    });
  }

  int selectedItem = 0;
  List _pages = [HomePage(), BarItemPage(), SearchPage(), MyPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _pages[selectedItem],
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 0,
        unselectedFontSize: 0,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: onTap,
        currentIndex: selectedItem,
        selectedItemColor: Colors.black54,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.apps),
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart_sharp),
            title: Text("Favourite"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text("Search"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text("Profile"),
          ),
        ],
      ),
    );
  }
}
