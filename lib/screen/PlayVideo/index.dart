import 'package:digiscan/screen/home/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// import 'package:video_player/video_player.dart';
// import 'package:chewie/chewie.dart';
import 'package:appinio_video_player/appinio_video_player.dart';

class PlayVideo extends StatefulWidget {
  final String videoLink;
  final String title;
  const PlayVideo(this.videoLink, this.title, {super.key});

  @override
  State<PlayVideo> createState() => _PlayVideoState();
}

class _PlayVideoState extends State<PlayVideo> {
  late VideoPlayerController videoPlayerController;
  late CustomVideoPlayerController _customVideoPlayerController;

  @override
  void initState() {
    super.initState();

// final myModel = Provider.of<YourProivder>(context, listen: false);
    // final appState = Provider.of<AppState>(context);
    // Replace 'assets/sample.mp4' with the path to your video file
    // _videoPlayerController =
    //     VideoPlayerController.networkUrl(Uri.parse(widget.link));
    // _chewieController = ChewieController(
    //     videoPlayerController: _videoPlayerController,
    //     aspectRatio: 16 / 9, // Adjust as needed
    //     autoPlay: false,
    //     looping: false,
    //     fullScreenByDefault: false,
    //     showOptions: false
    //     // Other customization options...
    //     );
    print("object");
    videoPlayerController =
        VideoPlayerController.networkUrl(Uri.parse(widget.videoLink))
          ..initialize().then((value) => setState(() {}));

    _customVideoPlayerController = CustomVideoPlayerController(
        context: context,
        videoPlayerController: videoPlayerController,
        customVideoPlayerSettings: CustomVideoPlayerSettings(
            settingsButtonAvailable: false,
            deviceOrientationsAfterFullscreen: [DeviceOrientation.portraitUp],
            placeholderWidget: Center(
              child: CircularProgressIndicator(),
            )));
    setState(() {});
  }

  @override
  void dispose() {
    // _videoPlayerController.dispose();
    _customVideoPlayerController.dispose();
    super.dispose();
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
                            _customVideoPlayerController
                                .customVideoPlayerSettings;

                            Navigator.pop(context);
                          },
                          child: Icon(Icons.arrow_back_ios)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20.00),
                      child: InkWell(
                        onTap: () {
                          _customVideoPlayerController.dispose();
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Home()));
                        },
                        child: Image.asset(
                          'images/logo.png',
                          width: 50.00,
                          height: 50.00,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 150,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    new Icon(Icons.arrow_forward_ios, size: 12.0),
                    Text(widget.title),
                  ],
                ),
                SizedBox(
                  height: 15.00,
                ),
                Container(
                  height: 150,
                  width: double.infinity,
                  child: CustomVideoPlayer(
                      customVideoPlayerController:
                          _customVideoPlayerController),
                  // child: Chewie(
                  //   controller: _chewieController,
                  // ),
                )
              ],
            ),
          )),
    );
  }
}
