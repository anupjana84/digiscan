import 'package:digiscan/screen/login/widget/header.dart';
import 'package:flutter/material.dart';

class Subcription extends StatefulWidget {
  const Subcription({super.key});

  @override
  State<Subcription> createState() => _SubcriptionState();
}

class _SubcriptionState extends State<Subcription> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
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
        child: SafeArea(
          child: Column(
            children: [
              Header(),
              SizedBox(
                height: 70,
              ),
              Padding(
                padding: EdgeInsets.only(left: 30.0, right: 30.00),
                child: Container(
                  height: 200,
                  child: Stack(
                    children: [
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.00),
                          image: DecorationImage(
                            image: NetworkImage(
                                "https://images.pexels.com/photos/19031635/pexels-photo-19031635/free-photo-of-a-window-with-a-reflection-of-trees-and-water.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                            color: Color(0xff000000).withOpacity(0.5),
                            borderRadius: BorderRadius.circular(10.00)),
                        child: Center(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Video Subscription",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25.00,
                                      fontWeight: FontWeight.w800),
                                ),
                                Text("Play subscribed videos",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15.00)),
                              ]),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.00),
              Padding(
                padding: EdgeInsets.only(left: 30.0, right: 30.00),
                child: Container(
                  height: 200,
                  child: Stack(
                    children: [
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.00),
                          image: DecorationImage(
                            image: NetworkImage(
                                "https://images.pexels.com/photos/19031635/pexels-photo-19031635/free-photo-of-a-window-with-a-reflection-of-trees-and-water.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                            color: Color(0xff000000).withOpacity(0.5),
                            borderRadius: BorderRadius.circular(10.00)),
                        child: Center(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Slides Subscription",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25.00,
                                      fontWeight: FontWeight.w800),
                                ),
                                Text("View subscribed virtual slides",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15.00)),
                              ]),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
