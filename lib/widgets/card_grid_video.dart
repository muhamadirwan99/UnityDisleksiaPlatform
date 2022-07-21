import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:unity_disleksia_platform/common/style.dart';
import 'package:unity_disleksia_platform/data/model/video_model.dart';

class CardGridVideo extends StatelessWidget {
  final Video video;

  const CardGridVideo({Key? key, required this.video}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String _baseUrl = 'http://34.128.78.90:5000/';
    return SizedBox(
      width: 160,
      child: Card(
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: neutral300, width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: FancyShimmerImage(
                  imageUrl: video.thumbnail,
                  height: 90,
                  width: 140,
                  boxFit: BoxFit.fill,
                  boxDecoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(4)),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Expanded(
                flex: 0,
                child: Text(
                  video.name,
                  style: myTextTheme.headline5,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
