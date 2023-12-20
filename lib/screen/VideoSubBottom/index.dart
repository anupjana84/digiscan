import 'package:digiscan/screen/VideoSub/index.dart';

import 'package:digiscan/screen/profile/index.dart';
import 'package:flutter/material.dart';

class VideoSubBottom extends StatefulWidget {
  VideoSubBottom({super.key});
  @override
  _VideoSubBottomState createState() => _VideoSubBottomState();
}

class _VideoSubBottomState extends State<VideoSubBottom> {
  int _currentIndex = 0;

  var name = "";
  var parentId = "";
  var email1 = "";
  var subCatId = "";
  @override
  void initState() {
    super.initState();
  }

  final List<Widget> _pages = [
    // Add your pages here
    new VideoSub(),

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
            icon: Icon(Icons.home),
            label: 'Home',
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

  // _buildPage(int index) {
  //   setState(() {
  //     parentId = widget.parentId;
  //     email1 = widget.email1;
  //     subCatId = widget.subCatId;
  //   });
  //   print(this.email1);
  //   switch (index) {
  //     case 0:
  //       return VideoSub(this.parentId, this.email1, this.subCatId);
  //     case 1:
  //       return Profile();
  //     // Add more cases for additional pages
  //     // Handle unexpected index
  //   }
  // }
}
