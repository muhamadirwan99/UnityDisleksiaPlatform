import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unity_disleksia_platform/common/style.dart';
import 'package:unity_disleksia_platform/data/model/video_model.dart';

class CardModul extends StatelessWidget {
  final Video video;

  const CardModul({required this.video});

  @override
  Widget build(BuildContext context) {
    const String _baseUrl = 'http://34.128.78.90:5000/';
    return Card(
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                _baseUrl + video.thumbnail,
                height: 110,
                width: 160,
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Text(
                    "Modul " + video.name,
                    style: myTextTheme.headline5,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Unduh",
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0,
                                  color: neutral100),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          SvgPicture.asset(
                            "assets/icons/send.svg",
                            color: neutral100,
                            height: 24,
                            width: 24,
                          ),
                        ],
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: blue500,
                      minimumSize: const Size.fromHeight(50),
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(8),
                      ),
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(top: 8, bottom: 8),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
