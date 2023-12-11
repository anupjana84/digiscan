import 'package:flutter/material.dart';
import 'package:digiscan/screen/home/index.dart';

class Slides extends StatefulWidget {
  const Slides({super.key});

  @override
  State<Slides> createState() => _SlidesState();
}

class _SlidesState extends State<Slides> {
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
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 200),
                  child: Text(
                    'No Slide Avaiable',
                    style: TextStyle(color: Colors.white, fontSize: 30.00),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
