import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';

class VideoPlayerDemo extends StatefulWidget {
  @override
  _VideoPlayerDemoState createState() => _VideoPlayerDemoState();
}

class _VideoPlayerDemoState extends State<VideoPlayerDemo> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('video player demo'),
      ),
      body: Column(
        children: <Widget>[
          Text('body')
        ],
      ),
    );
  }
}
