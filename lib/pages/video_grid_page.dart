import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unity_disleksia_platform/provider/video_provider.dart';
import 'package:unity_disleksia_platform/utils/result_state.dart';
import 'package:unity_disleksia_platform/widgets/card_grid_video.dart';

class VideoGridPage extends StatelessWidget {
  Widget _buildVideo() {
    return Consumer<VideoProvider>(
      builder: (context, state, _) {
        if (state.state == ResultState.Loading) {
          return Center(child: CircularProgressIndicator());
        } else if (state.state == ResultState.HasData) {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) {
              var video = state.result.data[index];
              return ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: CardGridVideo(video: video));
            },
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
