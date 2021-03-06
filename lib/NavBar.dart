// TopBar and BottomBar
import 'package:chatsystem/pages/Chats.dart';
import 'package:chatsystem/pages/News.dart';
import 'package:chatsystem/pages/Notifications.dart';
import 'package:chatsystem/pages/Settings.dart';
import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _currentIndex = 0;
  //page inside tab, stateless widget idk
  final List<Widget> _children = [
    News(),
    Chats(),
    Notifications(),
    // ColorContainer(Colors.yellow),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: Color.fromRGBO(0, 0, 76, 1),
              expandedHeight: 200.0,
              pinned: true,
              floating: false,
              snap: false,
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.settings),
                  tooltip: 'Settings',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Settings()),
                    );
                  },
                ),
              ],
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text(
                  "PDRM Chat System",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    // fontFamily: 'HelveticaNeue',
                  ),
                ),
                background: Image.network(
                  "http://viraverna.ir/wp-content/uploads/2017/11/digital-marketing-hero.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ];
        },
        body: Container(
          decoration: BoxDecoration(
              // image: DecorationImage(
              // image: NetworkImage(
              //     "https://www.bakercommunications.com/images/pattern-icons/2.png"),
              //   fit: BoxFit.cover,
              // ),
              ),
          child: _children[_currentIndex], //stateless widget goes here,
        ),
        // body: _children[_currentIndex], //stateless widget goes here
        // body: GestureDetector(
        //   onPanUpdate: (details) {
        //     if (details.delta.dx > 0) {
        //       print("go left");
        //       if (_currentIndex == 1) {
        //         _children[_currentIndex] = News();
        //       }
        //     } else if (details.delta.dx < 0) {
        //       print("go right");
        //     }
        //   },
        //   child: _children[_currentIndex], //stateless widget goes here,
        // ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.black,
        type: BottomNavigationBarType.fixed, //no animation
        items: [
          new BottomNavigationBarItem(
            // backgroundColor: Colors.black,
            icon: Icon(
              Icons.home,
              // color: Colors.black,
            ),
            title: Text(
              'Home',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          new BottomNavigationBarItem(
            icon: Icon(
              Icons.chat,
              // color: Colors.black,
            ),
            title: Text(
              'Chat',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          new BottomNavigationBarItem(
            icon: Icon(
              Icons.mail,
              // color: Colors.black,
            ),
            title: Text(
              'Notifications',
              style: TextStyle(
                // color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  //bottom nav bar navigation
  void onTabTapped(int index) {
    setState(
      () {
        _currentIndex = index;
      },
    );
    // print(_currentIndex);
  }
}
