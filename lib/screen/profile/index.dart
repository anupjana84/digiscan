import 'package:digiscan/screen/login/logIn.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:digiscan/screen/home/index.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var name = "";
  var email = "";
  var mobile = "";
  var userName = "";

  @override
  void initState() {
    super.initState();
    this.getDataa();
  }

  Future getDataa() async {
    final prefs = await SharedPreferences.getInstance();
    var userData = await prefs.getString('user');
    var convertData = jsonDecode(userData.toString());
    print(convertData);
    setState(() {
      name = convertData['name'];
      email = convertData['email'];
      userName = convertData['username'];
      mobile = convertData['mobile'];
    });
  }

  Future logOut() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('user');
    await prefs.remove('email');
    await prefs.remove('parentId');

    await prefs.remove('subCatId');

    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Login()));
  }

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
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.00),
                  child: InkWell(
                      onTap: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => Home()));
                      },
                      child: Icon(Icons.arrow_back_ios)),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20.00),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushReplacement(context,
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
            SizedBox(
              height: 150,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Center(
                child: ClipRRect(
                    // borderRadius: BorderRadius.circular(
                    //     50.0), // Adjust the radius as needed
                    // child: Image.network(
                    //   'https://images.pexels.com/photos/19049977/pexels-photo-19049977/free-photo-of-man-surfing-on-a-big-wave.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', // Replace with your image URL
                    //   width: 100.0, // Adjust the width as needed
                    //   height: 100.0, // Adjust the height as needed
                    //   fit: BoxFit
                    //       .cover, // You can use other BoxFit values based on your requirements
                    // ),
                    ),
              ),
            ),
            Container(
              height: 50,
              width: double.infinity,
              child: Row(
                children: [
                  Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text('Name',
                            style:
                                TextStyle(fontSize: 20, color: Colors.white)),
                      )),
                  Expanded(
                      flex: 7,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          name,
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ))
                ],
              ),
            ),
            Container(
              height: 50,
              width: double.infinity,
              child: Row(
                children: [
                  Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text('Email',
                            style:
                                TextStyle(fontSize: 20, color: Colors.white)),
                      )),
                  Expanded(
                      flex: 7,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          email,
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ))
                ],
              ),
            ),
            Container(
              height: 50,
              width: double.infinity,
              child: Row(
                children: [
                  Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text('Mobile',
                            style:
                                TextStyle(fontSize: 20, color: Colors.white)),
                      )),
                  Expanded(
                      flex: 7,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          mobile,
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ))
                ],
              ),
            ),
            Container(
              height: 50,
              width: double.infinity,
              child: Row(
                children: [
                  Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text('User Name',
                            style:
                                TextStyle(fontSize: 20, color: Colors.white)),
                      )),
                  Expanded(
                      flex: 7,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          userName,
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 100.00),
              child: Container(
                width: double.infinity, // Set width to fill the available space
                child: TextButton(
                  onPressed: () {
                    // Handle button press
                    logOut();
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.black, // Text color
                    backgroundColor:
                        Color(0xffDFA12B), // Button background color
                  ),
                  child: Text(
                    'Logout',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
