import 'package:flutter/material.dart';
import 'dart:math';
import 'package:video_player/video_player.dart';

class Video extends StatefulWidget {
  @override
  _VideoState createState() => _VideoState();
}

class _VideoState extends State<Video> {
  List<String> videos = [
    'assets/video/biggus_dickus.mp4',
    'assets/video/billy_boy_2.mp4',
    'assets/video/bright_side_of_life.mp4',
    'assets/video/ouioui_chanson.mp4',
    'assets/video/ouioui_poudre_magique.mp4',
    'assets/video/poisson_nomme_wanda.mp4',
    'assets/video/rue_des_potiers.mp4',
    'assets/video/weird_walk.mp4',
    'assets/video/winnie_the_pooh.mp4'
  ];
  Random rank = new Random();
  String video_path;
  VideoPlayerController playerController;
  VoidCallback listener;

  select_video() {
    video_path = videos[rank.nextInt(videos.length)];
    return video_path;
  }

  void create_video() {
    if (playerController == null) {
      playerController = VideoPlayerController.asset(select_video())
        ..addListener(listener)
        ..setVolume(1.0)
        ..initialize();
    }
  }

  @override
  void initState() {
    super.initState();
    listener = () {
      setState(() {});
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white10),
      body: Container(
          color: Colors.white10,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Center(
              child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Container(
                      child: (playerController != null
                          ? VideoPlayer(
                              playerController,
                            )
                          : Container()))))),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          create_video();
          playerController.play();
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
