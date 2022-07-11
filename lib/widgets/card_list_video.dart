import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unity_disleksia_platform/common/style.dart';
import 'package:unity_disleksia_platform/data/model/video_model.dart';

class CardListVideo extends StatelessWidget {
  final Video video;

  const CardListVideo({required this.video});

  @override
  Widget build(BuildContext context) {
    const String _baseUrl = 'http://34.128.78.90:5000/';
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: neutral300, width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Container(
              height: 91,
              width: 160,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(_baseUrl + video.thumbnail),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          video.name,
                          style: myTextTheme.subtitle1,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  Text(
                    video.desc,
                    style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.4,
                          color: neutral700),
                    ),
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
