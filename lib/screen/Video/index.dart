import 'package:digiscan/globalWiget/loder/cardLoder.dart';
import 'package:digiscan/provider/category.dart';
import 'package:digiscan/screen/VideoSubBottom/index.dart';
import 'package:digiscan/screen/home/index.dart';

import 'package:flutter/material.dart';
import 'package:digiscan/api/index.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:digiscan/provider/user.dart';
import 'package:provider/provider.dart';

class Video extends StatefulWidget {
  final String email;

  Video(this.email, {super.key});

  @override
  State<Video> createState() => _VideoState();
}

class _VideoState extends State<Video> {
  List data = [];
  var isLoading = false;

  var email1 = "";
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    this.getplayListData();

    // Replace 'assets/sample.mp4' with the path to your video file
  }

  Future<void> getplayListData() async {
    var api = Api.baseUri;
    final userprovider = Provider.of<UserProvider>(context, listen: false);
    try {
      final response = await http.post(
        Uri.parse(api + '/video-parent-playlist'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{"email": userprovider.email}),
      );
      if (response.statusCode == 200) {
        var res = jsonDecode(response.body);
        var listdata = res['parentCategoryPlaylist'];

        setState(() {
          data = listdata;
          _isLoading = false;
        });
      } else {
        var na = jsonDecode(response.body);
        print(na);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final categoryProvider =
        Provider.of<CategoryProvider>(context, listen: false);
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Container(
                //   height: 200,
                //   child: Chewie(
                //     controller: _chewieController,
                //   ),
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(left: 10.00),
                        child:
                            //  InkWell(
                            //     onTap: () {
                            //       Navigator.push(
                            //           context,
                            //           MaterialPageRoute(
                            //               builder: (context) => Home()));
                            //     },
                            ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Home()));
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Icon(Icons.arrow_back_ios),
                          ), // Icon(Icons.menu, color: Colors.white),
                          style: ElevatedButton.styleFrom(
                            shape: CircleBorder(),
                            padding: EdgeInsets.all(10),
                            backgroundColor:
                                Color(0xff6E3E82), // <-- Button color
                            foregroundColor: Colors.white, // <-- Splash color
                          ),
                        )
                        // Container(
                        //   width: 35.0,
                        //   height: 35.0,
                        //   decoration: new BoxDecoration(
                        //     color: Colors.orange,
                        //     shape: BoxShape.circle,
                        //   ),
                        //   child: Center(child: Icon(Icons.arrow_back_ios)),
                        // )
                        //  ),
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
                  padding: const EdgeInsets.only(left: 20.00),
                  child: Text(
                    'Subscribed Videos Playlist',
                    style: TextStyle(
                        fontSize: 25.00,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                ),

                Expanded(
                  child: _isLoading
                      ? const CardLoder()
                      : ListView.builder(
                          itemExtent: 200.00,
                          itemCount: data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () {
                                  categoryProvider.setParentId(data[index]
                                          ['parent_category_id']
                                      .toString());

                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          new VideoSubBottom(),
                                    ),
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(
                                          20.0), // Top-left corner
                                      bottomLeft: Radius.circular(
                                          20.0), // Bottom-right corner
                                    ),
                                  ),
                                  margin:
                                      EdgeInsets.only(top: 5.00, bottom: 5.00),
                                  height: 180,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 6,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(
                                                  20.0), // Top-left corner
                                              bottomLeft: Radius.circular(
                                                  20.0), // Bottom-right corner
                                            ),
                                          ),
                                          height: 180,
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(
                                                  20.0), // Top-left corner
                                              bottomLeft: Radius.circular(
                                                  20.0), // Bottom-right corner
                                            ),
                                            child: Image.network(
                                              data[index]['video_link'],
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 4,
                                        child: Container(
                                          padding: const EdgeInsets.only(
                                              left: 5.00,
                                              right: 5.00,
                                              top: 10.00),
                                          decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(20.0),
                                              bottomRight:
                                                  Radius.circular(20.0),
                                            ),
                                          ),

                                          height: 180, // Set the desired height
                                          child: Column(children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10.00),
                                              child: Text(
                                                data[index]['name'],
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                            // Padding(
                                            //   padding: const EdgeInsets.only(
                                            //       top: 12.00),
                                            //   child: TextButton(
                                            //       onPressed: () {},
                                            //       style: TextButton.styleFrom(
                                            //         backgroundColor:
                                            //             Color(0xffD09500),
                                            //         padding: EdgeInsets.only(
                                            //             left: 8.00,
                                            //             right:
                                            //                 8.00), // Button padding
                                            //         shape:
                                            //             RoundedRectangleBorder(
                                            //           side: BorderSide(
                                            //             color: Color(
                                            //                 0xffFFC83E), // Border color
                                            //             width:
                                            //                 2.0, // Border width
                                            //           ),

                                            //           borderRadius:
                                            //               BorderRadius.circular(
                                            //                   5.0), // Border radius
                                            //         ),
                                            //       ),
                                            //       child: Text(
                                            //         "Playlist",
                                            //         style: TextStyle(
                                            //             color:
                                            //                 Color(0xffFFC83E)),
                                            //       )),
                                            // )
                                          ]),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                ),
              ],
            )),
      ),
    );
  }
}
