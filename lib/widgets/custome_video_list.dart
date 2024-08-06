import 'package:flutter/material.dart';
import 'package:task_validation/widgets/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

/// A widget that displays a horizontally scrollable list of video thumbnails.
///
/// Each thumbnail corresponds to a YouTube video, and tapping on it navigates
/// to a video player screen.
class CustomeVideosList extends StatelessWidget {
  /// The list of YouTube video URLs to be displayed.
  final List<String> videoUrlList;

  /// Creates a [CustomeVideosList] widget.
  const CustomeVideosList({
    super.key,
    required this.videoUrlList,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 200,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: videoUrlList.length,
          itemBuilder: (context, index) {
            // Convert the YouTube video URL to its ID.
            final vidID = YoutubePlayer.convertUrlToId(videoUrlList[index]);

            // Create a clickable thumbnail for each video.
            return GestureDetector(
              onTap: () {
                // Navigate to the video player screen when tapped.
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => VideoPlayerScreen(
                            vidId: vidID ?? '',
                          )),
                );
              },
              child: AspectRatio(
                aspectRatio: 14 / 9,
                child: Container(
                  margin: const EdgeInsets.all(8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(
                      YoutubePlayer.getThumbnail(videoId: vidID ?? ''),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
