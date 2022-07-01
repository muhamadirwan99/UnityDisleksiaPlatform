import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unity_disleksia_platform/pages/detail_video_page.dart';
import 'package:unity_disleksia_platform/provider/video_recent_provider.dart';
import 'package:unity_disleksia_platform/utils/result_state.dart';
import 'package:unity_disleksia_platform/widgets/card_grid_video.dart';

class VideoRecentPage extends StatelessWidget {
  Widget _buildVideo() {
    return Consumer<VideoRecentProvider>(
      builder: (context, state, _) {
        if (state.state == ResultState.Loading) {
          return Center(child: CircularProgressIndicator());
        } else if (state.state == ResultState.HasData) {
          return SizedBox(
            height: 230.0,
            width: 200,
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
          return Center(child: Text(state.message));
        } else if (state.state == ResultState.Error) {
          return Center(child: Text(state.message));
        } else {
          return Center(child: Text(''));
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildVideo();
  }
}
