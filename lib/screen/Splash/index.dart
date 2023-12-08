import 'package:digiscan/globalWiget/splashImage.dart';
import 'package:digiscan/screen/home/index.dart';
import 'package:digiscan/screen/login/logIn.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    this.getDataa();
  }

  Future getDataa() async {
    final prefs = await SharedPreferences.getInstance();
    var dta = await prefs.getString('user');
    var userData = jsonDecode(dta.toString());
    print(userData);
    if (userData != null) {
      Timer(Duration(seconds: 2), () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Home()));
      });
    } else {
      Timer(Duration(seconds: 2), () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Login()));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.red[600],
      body: Container(
        clipBehavior: Clip.hardEdge,
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
        child: Center(child: SplashImage()
            //  Container(
            //   child: new Image.asset(
            //     'images/banner.png',
            //     width: 300.0,
            //     height: 240.0,
            //     fit: BoxFit.cover,
            //   ),
            // ),
            ),
      ),
    );
  }
}
