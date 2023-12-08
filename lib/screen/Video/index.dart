import 'package:flutter/material.dart';
import 'package:digiscan/screen/login/widget/header.dart';

class Video extends StatefulWidget {
  final String name;

  Video(this.name, {super.key});

  @override
  State<Video> createState() => _VideoState();
}

class _VideoState extends State<Video> {
  @override
  void initState() {
    super.initState();
    print("aname ${widget.name}");
  }

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
            child: ListView(
              children: [
                Header(),
                Padding(
                  padding: const EdgeInsets.only(left: 20.00),
                  child: Text(
                    'Lecture Videos for ${widget.name}',
                    style: TextStyle(
                        fontSize: 25.00,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.00),
                  child: Text('MBBS Students',
                      style: TextStyle(
                          fontSize: 25.00,
                          fontWeight: FontWeight.w400,
                          color: Colors.white)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10.00),
                    ),
                    margin: EdgeInsets.only(top: 5.00, bottom: 5.00),
                    height: 180,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 6,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.only(
                                topLeft:
                                    Radius.circular(20.0), // Top-left corner
                                bottomLeft: Radius.circular(
                                    20.0), // Bottom-right corner
                              ),
                            ),
                            height: 180,
                            child: Image.asset(
                              'images/Rectangle.png',
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Container(
                            padding: const EdgeInsets.only(
                                left: 5.00, right: 5.00, top: 10.00),
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20.0),
                                bottomRight: Radius.circular(20.0),
                              ),
                            ),

                            height: 180, // Set the desired height
                            child: Column(children: [
                              Text(
                                "Lecture Videos Available in Pathology for MBBS / Paramedical Students in English",
                                style: TextStyle(color: Colors.white),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 12.00),
                                child: TextButton(
                                    onPressed: () {},
                                    style: TextButton.styleFrom(
                                      backgroundColor: Color(0xffD09500),
                                      padding: EdgeInsets.only(
                                          left: 8.00,
                                          right: 8.00), // Button padding
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                          color:
                                              Color(0xffFFC83E), // Border color
                                          width: 2.0, // Border width
                                        ),

                                        borderRadius: BorderRadius.circular(
                                            5.0), // Border radius
                                      ),
                                    ),
                                    child: Text(
                                      "Playlist",
                                      style:
                                          TextStyle(color: Color(0xffFFC83E)),
                                    )),
                              )
                            ]),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10.00),
                    ),
                    margin: EdgeInsets.only(top: 5.00, bottom: 5.00),
                    height: 180,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 6,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft:
                                    Radius.circular(20.0), // Top-left corner
                                bottomLeft: Radius.circular(
                                    20.0), // Bottom-right corner
                              ),
                            ),
                            height: 180,
                            child: Image.asset(
                              'images/Rectangle.png',
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Container(
                            padding: const EdgeInsets.only(
                                left: 5.00, right: 5.00, top: 10.00),
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20.0),
                                bottomRight: Radius.circular(20.0),
                              ),
                            ),

                            height: 180, // Set the desired height
                            child: Column(children: [
                              Text(
                                "Lecture Videos Available in Pathology for MBBS / Paramedical Students in English",
                                style: TextStyle(color: Colors.white),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 12.00),
                                child: TextButton(
                                    onPressed: () {},
                                    style: TextButton.styleFrom(
                                      backgroundColor: Color(0xffD09500),
                                      padding: EdgeInsets.only(
                                          left: 8.00,
                                          right: 8.00), // Button padding
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                          color:
                                              Color(0xffFFC83E), // Border color
                                          width: 2.0, // Border width
                                        ),

                                        borderRadius: BorderRadius.circular(
                                            5.0), // Border radius
                                      ),
                                    ),
                                    child: Text(
                                      "Playlist",
                                      style:
                                          TextStyle(color: Color(0xffFFC83E)),
                                    )),
                              )
                            ]),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
