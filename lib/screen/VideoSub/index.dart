// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:js';

import 'package:flutter/material.dart';

import 'package:digiscan/helper/index.dart';
import 'package:digiscan/screen/Video/index.dart';
import 'package:digiscan/screen/home/index.dart';

class VideoSub extends StatefulWidget {
  final String userName;
  MyArguments arguments =
      ModalRoute.of(context as BuildContext)!.settings.arguments as MyArguments;
  VideoSub(
    Key? key,
    this.userName,
    this.arguments,
  ) : super(key: key);

  @override
  State<VideoSub> createState() => _VideoSubState();
}

class _VideoSubState extends State<VideoSub> {
  var name = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: FractionalOffset(0.5, 0),
                end: FractionalOffset(0.5, 1.0),
                colors: [
                  Color(0xffFFFFFF),
                  Color(0xffB892E3),
                  Color(0xff6E3E82),
                  Color(0xff9D78C7),
                  Color(0xff58246D),
                ],
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.00),
                      child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.arrow_back_ios)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20.00),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Home()));
                        },
                        child: Image.asset(
                          'images/logo.png',
                          width: 50.00,
                          height: 50.00,
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                    padding: EdgeInsets.only(left: 10.00, right: 10.00),
                    child: Column(
                      children: [
                        Row(
                          children: [Text("data")],
                        )
                      ],
                    )),
                Expanded(
                    child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8.0,
                          mainAxisSpacing: 8.0,
                        ),
                        itemCount: 20,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(10),
                            child: Container(
                              width: 150.0, // Adjust the width as needed
                              height: 250.0,
                              color: Colors.red,
                              child: Text('dddd ${widget.userName}'),
                            ),
                          );
                        }))
              ],
            )),
      ),
    );
  }
}
