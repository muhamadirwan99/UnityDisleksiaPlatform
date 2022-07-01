import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unity_disleksia_platform/common/style.dart';
import 'package:unity_disleksia_platform/data/model/video_model.dart';

class CardGridVideo extends StatelessWidget {
  final Video video;

  const CardGridVideo({required this.video});

  @override
  Widget build(BuildContext context) {
    const String _baseUrl = 'http://34.128.78.90:5000/';
    return Container(
      height: 230.0,
      width: 200,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 110,
                width: 166,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
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
              const SizedBox(
                height: 8,
              ),
              Text(
                video.desc,
                style: GoogleFonts.inter(
                  textStyle: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0,
                      color: neutral700),
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        elevation: 2,
      ),
    );
  }
}
