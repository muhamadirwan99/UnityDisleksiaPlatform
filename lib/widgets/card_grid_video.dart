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
      width: 182,
      child: Card(
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: neutral300, width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 110,
                width: 166,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(4)),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(_baseUrl + video.thumbnail),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                video.name,
                style: myTextTheme.headline5,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
