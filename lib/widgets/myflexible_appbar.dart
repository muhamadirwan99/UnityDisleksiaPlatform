import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:unity_disleksia_platform/common/style.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unity_disleksia_platform/pages/videos/video_search_page.dart';

class MyFlexibleAppBar extends StatelessWidget {
  final double appBarHeight = 66.0;

  const MyFlexibleAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Container(
      padding: EdgeInsets.only(top: statusBarHeight, left: 16, right: 16),
      height: statusBarHeight + appBarHeight,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: Text(
                    "Ayo kita mulai belajar", //headline 5
                    style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.2,
                          color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 23.0, left: 8.0),
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, VideoSearchPage.routeName);
                },
                icon: SvgPicture.asset(
                  "assets/icons/search.svg",
                  color: neutral500,
                  height: 24,
                  width: 24,
                ),
                label: Text(
                  "Mau belajar apa hari ini?",
                  style: GoogleFonts.roboto(
                    textStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        letterSpacing: -0.6,
                        color: neutral500),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  minimumSize: const Size.fromHeight(50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(
                      left: 16, right: 16, top: 12, bottom: 12),
                ),
              ),
            ),
          ],
        ),
      ),
      decoration: BoxDecoration(
        color: blue500,
        borderRadius: BorderRadius.circular(24),
      ),
    );
  }
}
