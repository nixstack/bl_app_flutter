import 'package:bl_app_flutter/page/ChatPage.dart';
import 'package:bl_app_flutter/page/RequirementPage.dart';
import 'package:bl_app_flutter/page/HomePage.dart';
import 'package:bl_app_flutter/page/MinePage.dart';
import 'package:bl_app_flutter/page/LearnPage.dart';
import 'package:flutter/material.dart';

class TabNavigator extends StatefulWidget {
  @override
  _TabNavigatorState createState() => _TabNavigatorState();

}

class _TabNavigatorState extends State<TabNavigator> {
  final _defaultColor = Colors.grey;
  final _activeColor = Colors.blue;

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final PageController _controller = PageController(
      initialPage: 0
    );

    return Scaffold(
      body: PageView(
        controller: _controller,
        onPageChanged: (int index) {
//          setState(() {
//            if (index != _currentIndex) {
//              _currentIndex = index;
//            }
//          });
        },
        children: <Widget>[
          HomePage(),
          LearnPage(),
          RequirementPage(),
          ChatPage(),
          MinePage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          _controller.jumpToPage(index);
          setState(() {
            if (index != _currentIndex) {
              _currentIndex = index;
            }
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: _defaultColor,
            ),
            activeIcon: Icon(
              Icons.home,
              color: _activeColor,
            ),
            title: Text(
              '首页',
              style: TextStyle(
                color: _currentIndex == 0 ? _activeColor : _defaultColor
              ),
            )
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.golf_course,
                color: _defaultColor,
              ),
              activeIcon: Icon(
                Icons.golf_course,
                color: _activeColor,
              ),
              title: Text(
                '学习',
                style: TextStyle(
                    color: _currentIndex == 1 ? _activeColor : _defaultColor
                ),
              )
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.border_color,
                color: _defaultColor,
              ),
              activeIcon: Icon(
                Icons.border_color,
                color: _activeColor,
              ),
              title: Text(
                '需求',
                style: TextStyle(
                    color: _currentIndex == 2 ? _activeColor : _defaultColor
                ),
              )
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.bubble_chart,
                color: _defaultColor,
              ),
              activeIcon: Icon(
                Icons.bubble_chart,
                color: _activeColor,
              ),
              title: Text(
                '微聊',
                style: TextStyle(
                    color: _currentIndex == 3 ? _activeColor : _defaultColor
                ),
              )
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle,
                color: _defaultColor,
              ),
              activeIcon: Icon(
                Icons.account_circle,
                color: _activeColor,
              ),
              title: Text(
                '我的',
                style: TextStyle(
                    color: _currentIndex == 4 ? _activeColor : _defaultColor
                ),
              )
          ),
        ],
      ),
    );
  }

}