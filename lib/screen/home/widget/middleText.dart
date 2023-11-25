import 'package:flutter/material.dart';

class MiddleText extends StatelessWidget {
  const MiddleText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: Column(
        children: [
          Padding(
              padding: EdgeInsets.only(top: 5, bottom: 12),
              child: Text(
                "We'LL MAKE IT",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.w700),
              )),
          Padding(
              padding: EdgeInsets.only(bottom: 12),
              child: Text(
                "SIMPLE AND",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.w700),
              )),
          Padding(
              padding: EdgeInsets.only(bottom: 12),
              child: Text(
                "EASY TO USE",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.w700),
              )),
        ],
      ),
    );
  }
}
