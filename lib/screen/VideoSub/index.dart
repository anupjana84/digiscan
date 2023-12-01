import 'package:flutter/material.dart';

class VideoSub extends StatefulWidget {
  const VideoSub({super.key});

  @override
  State<VideoSub> createState() => _VideoSubState();
}

class _VideoSubState extends State<VideoSub> {
  var name = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
                padding: EdgeInsets.only(left: 10.00, right: 10.00),
                child: Column(
                  children: [
                    Row(
                      children: [Text("data")],
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
                    itemCount: 20,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          width: 150.0, // Adjust the width as needed
                          height: 250.0,
                          color: Colors.red,
                          child: Text('dddd'),
                        ),
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
