import 'package:cybersafe_mx/utils/courseBtn_widget.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayer extends StatefulWidget {
  const VideoPlayer({super.key});

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  final String url = "https://youtu.be/IArn0R-iB24";
  late YoutubePlayerController _controller;

  @override
  void initState() {
    final videoId = YoutubePlayer.convertUrlToId(url);
    _controller = YoutubePlayerController(
      initialVideoId: videoId!,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        showLiveFullscreenButton: false,
      ),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
        ),
        const SizedBox(
          height: 30,
        ),
        CourseButton(
          text: "Tomar examen",
          onPressed: () {},
        ),
      ]),
    );
  }
}
