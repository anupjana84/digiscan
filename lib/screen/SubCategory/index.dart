import 'package:digiscan/provider/category.dart';
import 'package:digiscan/screen/PlayVideo/index.dart';

import 'package:digiscan/screen/home/index.dart';

import 'package:flutter/material.dart';
import 'package:digiscan/api/index.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'package:digiscan/provider/user.dart';
import 'package:digiscan/provider/category.dart';

class SubCategory extends StatefulWidget {
  SubCategory({super.key});

  @override
  State<SubCategory> createState() => _SubCategoryState();
}

class _SubCategoryState extends State<SubCategory> {
  var list = [];
  var videoLink = "";
  var title = "";
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    this.getData();
  }

  Future<void> getData() async {
    var api = Api.baseUri;
    final categoryProvider =
        Provider.of<CategoryProvider>(context, listen: false);
    final userprovider = Provider.of<UserProvider>(context, listen: false);
    print(categoryProvider.parentId);
    print(categoryProvider.subCatId);
    try {
      final response = await http.post(
        Uri.parse(api + '/video-child-video-playlist'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          "email": userprovider
              .email, // "subha999@gmail.com", //"subha999@gmail.com",
          "parent_category_id": categoryProvider.parentId, //'7',
          "sub_category_id": categoryProvider.subCatId, //'7',
        }),
      );

      if (response.statusCode == 200) {
        var res = jsonDecode(response.body);
        var listdata = res['videos'];
        // print(listdata);
        // print("listdata");

        setState(() {
          list = listdata;
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
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => Home()));
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
                        // InkWell(
                        //     onTap: () {
                        //       Navigator.pop(context);
                        //     },
                        //     child: Icon(Icons.arrow_back_ios)

                        //     ),
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
                    'Video Play List ',
                    style: TextStyle(
                        fontSize: 25.00,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                ),

                Expanded(
                  child: _isLoading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : ListView.builder(
                          itemExtent: 50.00,
                          itemCount: list.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    videoLink =
                                        list[index]['sub_category_video_link'];
                                    title = list[index]['video_name'];
                                  });
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          PlayVideo(this.videoLink, this.title),
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
                                  height: 150,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: new Icon(Icons.arrow_forward_ios,
                                            size: 12.0),
                                      ),
                                      Expanded(
                                        flex: 10,
                                        child: Text(
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            '${list[index]['video_name']}'),
                                      ),

                                      // Padding(
                                      //   padding: const EdgeInsets.only(left: 10.0),
                                      //   child: Expanded(
                                      //     child: SingleChildScrollView(
                                      //       scrollDirection: Axis.horizontal,
                                      //       child: Text(
                                      //           maxLines: 1,
                                      //           overflow: TextOverflow.ellipsis,
                                      //           '${list[index]['video_name']}'),
                                      //     ),
                                      //   ),
                                      // )
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
