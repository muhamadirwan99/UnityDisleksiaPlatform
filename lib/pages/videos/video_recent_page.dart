import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:unity_disleksia_platform/pages/videos/detail_video_page.dart';
import 'package:unity_disleksia_platform/provider/video_recent_provider.dart';
import 'package:unity_disleksia_platform/utils/result_state.dart';
import 'package:unity_disleksia_platform/widgets/card_grid_video.dart';
import 'package:unity_disleksia_platform/widgets/skeleton.dart';

class VideoRecentPage extends StatelessWidget {
  const VideoRecentPage({Key? key}) : super(key: key);

  Widget _buildVideo() {
    return Consumer<VideoRecentProvider>(
      builder: (context, state, _) {
        if (state.state == ResultState.Loading) {
          return SizedBox(
            height: 142,
            child: ListView.separated(
              padding: const EdgeInsets.only(left: 20, right: 16),
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (context, index) => const Skeleton(
                width: 148,
                height: 142,
              ),
              separatorBuilder: (context, index) => const SizedBox(width: 8),
            ),
          );
        } else if (state.state == ResultState.HasData) {
          return SizedBox(
            height: 160,
            child: ListView.builder(
              padding: const EdgeInsets.only(left: 20, right: 16),
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: state.result.data.length,
              itemBuilder: (context, index) {
                var video = state.result.data[index];
                return GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: CardGridVideo(video: video)),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, DetailVideoPage.routeName,
                        arguments: video);
                  },
                );
              },
            ),
          );
        } else if (state.state == ResultState.NoData) {
          return Center(
            child: SvgPicture.asset(
              "assets/illustrations/video-empty.svg",
            ),
          );
        } else if (state.state == ResultState.Error) {
          return Center(
            child: SvgPicture.asset(
              "assets/illustrations/noconnection.svg",
            ),
          );
        } else {
          return const Center(child: Text(''));
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildVideo();
  }
}
