import 'package:flutter/material.dart';

class Header extends StatefulWidget {
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  String url = "https://picsum.photos/250?image=9";
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: Center(
        child: Container(
          child: new Image.asset(
            'images/banner.png',
            fit: BoxFit.cover,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),

            // image: new DecorationImage(
            //   image: new NetworkImage(url),
            //   fit: BoxFit.cover,
            // ),
          ),
        ),
      ),
    );
  }
}
