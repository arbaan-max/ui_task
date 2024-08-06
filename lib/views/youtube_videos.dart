import 'package:flutter/material.dart';
import 'package:task_validation/constants/custome_colors.dart';
import 'package:task_validation/widgets/custome_video_list.dart';

/// Example lists of YouTube video URLs to be displayed in the video lists.
final videosUrl = [
  'https://www.youtube.com/watch?v=cTWEYIgpphs',
  'https://www.youtube.com/watch?v=Jt8Fod6cuxY',
  'https://www.youtube.com/watch?v=delnqdiXA-c',
];
final videosUrl2 = [
  'https://www.youtube.com/watch?v=izr7uBuiacE',
  'https://www.youtube.com/watch?v=PkPAtfNNJX8',
  'https://www.youtube.com/watch?v=b6Z885Z46cU',
];

/// A stateful widget that represents a page displaying multiple lists of
/// tutorial videos.
///
/// Each list is a [CustomeVideosList] widget containing clickable YouTube
/// video thumbnails.
class YoutubeVideosPage extends StatefulWidget {
  const YoutubeVideosPage({super.key});

  @override
  State<YoutubeVideosPage> createState() => _YoutubeVideosPageState();
}

class _YoutubeVideosPageState extends State<YoutubeVideosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.background,

      /// AppBar configuration
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: CustomColors.background,
        title: const Text(
          'How to Use',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
        ),
      ),

      ///  UI layout
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: CustomScrollView(
          slivers: [
            /// Title for the first video list
            const SliverToBoxAdapter(
              child: Text(
                'Tutorials videos',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
            ),

            /// List 1: Displays the first set of video URLs
            CustomeVideosList(videoUrlList: videosUrl),

            /// Title for the second video list
            const SliverToBoxAdapter(
              child: Text(
                'More tutorials',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
            ),

            /// List 2: Displays the second set of video URLs
            CustomeVideosList(videoUrlList: videosUrl2),

            /// Title for the third video list
            const SliverToBoxAdapter(
              child: Text(
                'Additional tutorials',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
            ),

            /// List 3: Reuses the first set of video URLs
            CustomeVideosList(videoUrlList: videosUrl),
          ],
        ),
      ),
    );
  }
}
