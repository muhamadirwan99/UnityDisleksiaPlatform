import 'package:flutter/material.dart';
import 'package:unity_disleksia_platform/common/style.dart';
import 'package:unity_disleksia_platform/data/model/video_model.dart';

class DetailVideoPage extends StatelessWidget {
  static const routeName = '/detailPage';

  final Video video;

  const DetailVideoPage({required this.video});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detail Video',
          style: myTextTheme.headline3,
        ),
        titleTextStyle: const TextStyle(color: neutral900),
        elevation: 0,
        backgroundColor: neutral100,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: neutral900,
            size: 32,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Text(video.name),
      ),
    );
  }
}
