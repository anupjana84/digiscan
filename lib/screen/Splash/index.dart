import 'package:digiscan/globalWiget/splashImage.dart';
import 'package:digiscan/screen/ForgotPassword/index.dart';
import 'package:digiscan/screen/Success/index.dart';
import 'package:digiscan/screen/home/index.dart';
import 'package:digiscan/screen/home/widget/header.dart';
import 'package:digiscan/screen/login/logIn.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => ForgotPassword()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[600],
      body: Container(
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
