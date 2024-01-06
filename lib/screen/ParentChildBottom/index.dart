import 'package:digiscan/screen/SubCategory/index.dart';

import 'package:digiscan/screen/profile/index.dart';
import 'package:flutter/material.dart';

class ParentChildBottom extends StatefulWidget {
  @override
  _ParentChildBottomState createState() => _ParentChildBottomState();
}

class _ParentChildBottomState extends State<ParentChildBottom> {
  int _currentIndex = 0;

  var name = "";
  final List<Widget> _pages = [
    // Add your pages here
    SubCategory(),

    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black, // Set the selected tab color
        unselectedItemColor: Colors.grey, // Set the unselected tab color
        backgroundColor: Colors.white, // Set the background color
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.featured_play_list),
            label: 'Video List',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.image_rounded),
          //   label: 'Slides',
          // ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.videocam_sharp),
          //   label: 'Video',
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
