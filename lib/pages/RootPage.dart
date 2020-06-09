import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'StatusPage.dart';
import 'MinePage.dart';
import 'DiscoverPage.dart';

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  var _curIndex = 0;

  initState() {
    super.initState();
  }

  handleTabOnPress(int index) {
    setState(() {
      _curIndex = index;
    });
  }

  var pages = [HomePage(), DisCoverPage(), StatusPage(), MinePage()];

  var bottomBarItems = [
    BottomNavigationBarItem(icon: Icon(Icons.ac_unit), title: Text('首页')),
    BottomNavigationBarItem(icon: Icon(Icons.add), title: Text('发现')),
    BottomNavigationBarItem(icon: Icon(Icons.add_a_photo), title: Text('动态')),
    BottomNavigationBarItem(icon: Icon(Icons.add_alarm), title: Text('我的')),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          onTap: (int index) {
            this.handleTabOnPress(index);
          },
          type: BottomNavigationBarType.fixed,
          currentIndex: _curIndex,
          items: bottomBarItems,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.black,
        ),
        body: pages[_curIndex],
      ),
    );
  }
}
