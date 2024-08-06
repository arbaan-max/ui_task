import 'package:flutter/material.dart';
import 'package:task_validation/constants/custome_colors.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

/// A stateful widget that displays a YouTube video player.
///
/// The video is played using the [YoutubePlayerController], which is initialized
/// with a video ID passed as a parameter to the widget.
class VideoPlayerScreen extends StatefulWidget {
  /// The YouTube video ID of the video to be played.
  final String vidId;

  /// Creates a [VideoPlayerScreen] widget.
  const VideoPlayerScreen({super.key, required this.vidId});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  /// The controller for managing the YouTube video playback.
  late final YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: widget.vidId,
    flags: const YoutubePlayerFlags(
      mute: false,
      disableDragSeek: false,
      loop: false,
      isLive: false,
      forceHD: false,
      enableCaption: true,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.background,

      /// AppBar configuration
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: CustomColors.background,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        title: const Text(
          'Selected Video',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
        ),
      ),

      /// Body content: YouTube Player
      body: YoutubePlayer(
        controller: _controller,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
