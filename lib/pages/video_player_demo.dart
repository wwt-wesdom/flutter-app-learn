import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerDemo extends StatefulWidget {
  @override
  _VideoPlayerDemoState createState() => _VideoPlayerDemoState();
}

class _VideoPlayerDemoState extends State<VideoPlayerDemo> {
  VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.network(
        'https://www.sample-videos.com/video123/mp4/480/big_buck_bunny_480p_20mb.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('video player demo'),
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: _videoPlayerController.value.initialized
                ? AspectRatio(
                    aspectRatio: _videoPlayerController.value.aspectRatio,
                    child: VideoPlayer(
                        _videoPlayerController
                    ),
                  )
                : Container(
              width: MediaQuery.of(context).size.width - 30,
              height: 200,
//              color: Colors.yellow,
            ),
          ),
          RaisedButton(
            onPressed: (){
                setState(() {
                  _videoPlayerController.value.isPlaying
                      ? _videoPlayerController.pause()
                      : _videoPlayerController.play();
                });
              },
            child: Icon(
              _videoPlayerController.value.isPlaying ? Icons.pause : Icons.play_arrow,
            ),
          )
        ],
      ),
    );
  }
}
