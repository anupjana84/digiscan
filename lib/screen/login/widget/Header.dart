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
      height: 60,
      padding: EdgeInsets.only(right: 10.0, top: 5.00),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),

        // image: new DecorationImage(
        //   image: new NetworkImage(url),
        //   fit: BoxFit.cover,
        // ),
      ),
      child: Row(
        children: [
          Spacer(),
          new Image.asset(
            'images/logo.png',
            width: 50.00,
            height: 50.00,
          )
        ],
      ),
    );
  }
}
