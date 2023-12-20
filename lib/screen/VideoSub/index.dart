// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:digiscan/screen/PlayVideo/index.dart';

import 'package:flutter/material.dart';

import 'package:digiscan/screen/home/index.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:digiscan/api/index.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VideoSub extends StatefulWidget {
  VideoSub({super.key});

  @override
  State<VideoSub> createState() => _VideoSubState();
}

class _VideoSubState extends State<VideoSub> {
  var list = [];
  var videoLink = "";
  @override
  void initState() {
    this.getDataforApi();
    super.initState();
  }

  Future<void> getData(email, parentId, subCatId) async {
    var api = Api.baseUri;

    try {
      final response = await http.post(
        Uri.parse(api + '/video-parent-child-playlist'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          "email": email, // "subha999@gmail.com", //"subha999@gmail.com",
          "parent_category_id": parentId, //'7',
          "sub_category_id": subCatId //"9"
        }),
      );
      print(response);
      if (response.statusCode == 200) {
        var res = jsonDecode(response.body);
        var listdata = res['uplaylist'];
        // print(listdata);
        // print("listdata");

        setState(() {
          list = listdata;
        });
      } else {
        var na = jsonDecode(response.body);
        print(na);
      }
    } catch (e) {
      print(e);
    }
  }

  Future getDataforApi() async {
    final prefs = await SharedPreferences.getInstance();
    var email = await prefs.getString('email');

    var parentId = await prefs.getString('parentId');
    var subcatId = await prefs.getString('subcatId');
    var convertEmail = jsonDecode(email.toString());
    var convertparentId = jsonDecode(parentId.toString());
    var convertsubcatId = jsonDecode(subcatId.toString());

    this.getData(convertEmail, convertparentId, convertsubcatId);
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
                          children: [Text("")],
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
                        itemCount: list.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(10),
                            child: Container(
                              width: 150.0, // Adjust the width as needed
                              height: 250.0,

                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    videoLink =
                                        list[index]['sub_category_video_link'];
                                  });
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          PlayVideo(this.videoLink),
                                    ),
                                  );
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Image.network(
                                    'https://digiscan.co.in/digi-app/public/img/thumb.png',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                          );
                        }))
              ],
            )),
      ),
    );
  }
}
