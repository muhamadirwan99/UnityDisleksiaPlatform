import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:unity_disleksia_platform/pages/videos/detail_video_page.dart';
import 'package:unity_disleksia_platform/provider/video_provider.dart';
import 'package:unity_disleksia_platform/utils/result_state.dart';
import 'package:unity_disleksia_platform/widgets/card_list_video.dart';

class VideoListPage extends StatelessWidget {
  const VideoListPage({Key? key}) : super(key: key);

  Widget _buildVideo() {
    return Consumer<VideoProvider>(
      builder: (context, state, _) {
        if (state.state == ResultState.Loading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.state == ResultState.HasData) {
          return ListView.builder(
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: state.result.data.length,
            itemBuilder: (context, index) {
              var video = state.result.data[index];
              return GestureDetector(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: CardListVideo(video: video),
                ),
                onTap: () {
                  Navigator.pushNamed(context, DetailVideoPage.routeName,
                      arguments: video);
                },
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
          return Center(child: Text(state.message));
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
