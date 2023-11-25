import 'package:flutter/material.dart';

class SplashImage extends StatefulWidget {
  const SplashImage({super.key});

  @override
  State<SplashImage> createState() => _SplashImageState();
}

class _SplashImageState extends State<SplashImage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: Center(
        child: Container(
          child: new Image.asset(
            'images/banner.png',
            fit: BoxFit.cover,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),

            // image: new DecorationImage(
            //   image: new NetworkImage(url),
            //   fit: BoxFit.cover,
            // ),
          ),
        ),
      ),
    );
  }
}
