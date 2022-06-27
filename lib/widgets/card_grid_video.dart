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
      height: 210.0,
      width: 182.0,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  _baseUrl + video.thumbnail,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      video.name,
                      style: myTextTheme.headline5,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Expanded(
                    flex: 0,
                    child: SvgPicture.asset(
                      "assets/icons/bookmark-outline.svg",
                      color: neutral900,
                      height: 24,
                      width: 24,
                    ),
                  ),
                ],
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
        elevation: 3,
      ),
    );
  }
}