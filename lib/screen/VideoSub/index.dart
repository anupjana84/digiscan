// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:digiscan/globalWiget/loder/cardLoder.dart';
import 'package:digiscan/provider/category.dart';
import 'package:digiscan/screen/ParentChildBottom/index.dart';

import 'package:flutter/material.dart';

import 'package:digiscan/screen/home/index.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:digiscan/api/index.dart';

import 'package:provider/provider.dart';
import 'package:digiscan/provider/user.dart';

class VideoSub extends StatefulWidget {
  VideoSub({super.key});

  @override
  State<VideoSub> createState() => _VideoSubState();
}

class _VideoSubState extends State<VideoSub> {
  var list = [];
  var videoLink = "";
  bool _isLoading = true;
  @override
  void initState() {
    this.getData();
    super.initState();
  }

  Future<void> getData() async {
    var api = Api.baseUri;
    final userprovider = Provider.of<UserProvider>(context, listen: false);
    final categoryProvider =
        Provider.of<CategoryProvider>(context, listen: false);

    try {
      final response = await http.post(
        Uri.parse(api + '/video-child-playlist'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          "email": userprovider.email, //"subha999@gmail.com",

          "parent_category_id": categoryProvider.parentId // parentId, //'7',
        }),
      );

      if (response.statusCode == 200) {
        var res = jsonDecode(response.body);
        var listdata = res['uplaylist'];

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
              children: [
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

                        //  InkWell(
                        //     onTap: () {
                        //       Navigator.pop(context);
                        //     },
                        //     child: Icon(Icons.arrow_back_ios)

                        ),
                    //  ),
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
                          children: [Text("")],
                        )
                      ],
                    )),
                Expanded(
                  child: _isLoading
                      ? CardLoder()
                      : ListView.builder(
                          itemCount: list.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10.00),
                                    child: Text(
                                      list[index]["sub_category_name"],
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16.00,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                ListView.builder(
                                    // inner ListView
                                    shrinkWrap: true, // 1st add
                                    physics: ClampingScrollPhysics(), // 2nd add
                                    itemCount: list[index]['videos'].length,
                                    itemBuilder:
                                        (BuildContext context, indexx) {
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: InkWell(
                                          onTap: () {
                                            categoryProvider.setSubId(list[
                                                        index]['videos'][indexx]
                                                    ['sub_category_video_id']
                                                .toString());

                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      //PlayVideo(this.videoLink),
                                                      ParentChildBottom()),
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
                                            margin: EdgeInsets.only(
                                                top: 5.00, bottom: 5.00),
                                            height: 180,
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  flex: 6,
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topLeft: Radius.circular(
                                                            20.0), // Top-left corner
                                                        bottomLeft: Radius.circular(
                                                            20.0), // Bottom-right corner
                                                      ),
                                                    ),
                                                    height: 180,
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topLeft: Radius.circular(
                                                            20.0), // Top-left corner
                                                        bottomLeft: Radius.circular(
                                                            20.0), // Bottom-right corner
                                                      ),
                                                      child: Image.network(
                                                        list[index]['videos']
                                                                [indexx][
                                                            'video_thumb_nail'],
                                                        fit: BoxFit.fill,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 4,
                                                  child: Container(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 5.00,
                                                            right: 5.00,
                                                            top: 10.00),
                                                    decoration: BoxDecoration(
                                                      color: Colors.black,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topRight:
                                                            Radius.circular(
                                                                20.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                                20.0),
                                                      ),
                                                    ),

                                                    height:
                                                        180, // Set the desired height
                                                    child: Column(children: [
                                                      Text(
                                                        '${list[index]['videos'][indexx]['video_name']}',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ]),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    })
                              ],
                            );
                          }),
                ),
              ],
            )),
      ),
    );
  }
}
