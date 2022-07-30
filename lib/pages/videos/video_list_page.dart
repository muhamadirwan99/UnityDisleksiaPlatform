import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:unity_disleksia_platform/pages/videos/detail_video_page.dart';
import 'package:unity_disleksia_platform/provider/video_provider.dart';
import 'package:unity_disleksia_platform/utils/result_state.dart';
import 'package:unity_disleksia_platform/widgets/card_list_video.dart';
import 'package:unity_disleksia_platform/widgets/skeleton.dart';

class VideoListPage extends StatefulWidget {
  const VideoListPage({Key? key}) : super(key: key);

  @override
  State<VideoListPage> createState() => _VideoListPageState();
}

class _VideoListPageState extends State<VideoListPage> {
  Widget _buildVideo() {
    return Consumer<VideoProvider>(
      builder: (context, state, _) {
        if (state.state == ResultState.Loading) {
          return SizedBox(
            height: 115,
            child: ListView.separated(
              padding: const EdgeInsets.only(right: 24, left: 24, bottom: 14),
              scrollDirection: Axis.vertical,
              itemCount: 6,
              itemBuilder: (context, index) => const Skeleton(
                height: 115,
                width: 380,
              ),
              separatorBuilder: (context, index) => const SizedBox(width: 10),
            ),
          );
        } else if (state.state == ResultState.HasData) {
          return ListView.builder(
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: state.result.data.length,
            itemBuilder: (context, index) {
              var video = state.result.data[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: GestureDetector(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: CardListVideo(video: video),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, DetailVideoPage.routeName,
                        arguments: video);
                  },
                ),
              );
            },
          );
        } else if (state.state == ResultState.NoData) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 180),
              child: SvgPicture.asset(
                "assets/illustrations/video-empty.svg",
              ),
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
