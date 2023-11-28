import 'package:cybersafe_mx/utils/courseBtn_widget.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayer extends StatefulWidget {
  final String videoURL;
  final String title;
  const VideoPlayer({
    super.key,
    required this.videoURL,
    required this.title,
  });

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    final videoId = YoutubePlayer.convertUrlToId(widget.videoURL);
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
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(
              color: Colors.white), // Establecer el color del texto en blanco
        ),
        backgroundColor: const Color(0xFF4548E6),
      ),
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
