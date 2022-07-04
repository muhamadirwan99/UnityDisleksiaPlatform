import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unity_disleksia_platform/pages/detail_video_page.dart';
import 'package:unity_disleksia_platform/provider/video_provider.dart';
import 'package:unity_disleksia_platform/provider/video_recent_provider.dart';
import 'package:unity_disleksia_platform/utils/result_state.dart';
import 'package:unity_disleksia_platform/widgets/card_grid_video.dart';
import 'package:unity_disleksia_platform/widgets/card_list_video.dart';

class VideoListPage extends StatefulWidget {
  final String value;

  VideoListPage({required this.value});

  @override
  State<VideoListPage> createState() => _VideoListPageState();
}

class _VideoListPageState extends State<VideoListPage> {
  Widget _buildVideo() {
    return Consumer<VideoProvider>(
      builder: (context, state, _) {
        if (state.state == ResultState.Loading) {
          return Center(child: CircularProgressIndicator());
        } else if (state.state == ResultState.HasData) {
          List<dynamic> listData = state.result.data;

          void updateList(value) {
            setState(() {
              listData = state.result.data
                  .where((element) =>
                      element.name!.toLowerCase().contains(value.toLowerCase()))
                  .toList();
            });
          }

          return ListView.builder(
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: listData.length,
            itemBuilder: (context, index) {
              var video = listData[index];
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
