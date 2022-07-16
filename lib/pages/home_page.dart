import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unity_disleksia_platform/common/style.dart';
import 'package:unity_disleksia_platform/pages/webinars/carousel_webinar_recent_page.dart';
import 'package:unity_disleksia_platform/pages/latihan/latihan_menu_page.dart';
import 'package:unity_disleksia_platform/pages/tips_page.dart';
import 'package:unity_disleksia_platform/pages/videos/video_menu_page.dart';
import 'package:unity_disleksia_platform/pages/videos/video_recent_page.dart';
import 'package:unity_disleksia_platform/pages/webinars/webinar_menu_page.dart';
import 'package:unity_disleksia_platform/pages/webinars/webinar_recent_page.dart';
import 'package:unity_disleksia_platform/widgets/myappbar.dart';
import 'package:unity_disleksia_platform/widgets/myflexible_appbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          const SliverAppBar(
            elevation: 0,
            automaticallyImplyLeading: false,
            expandedHeight: 180.0,
            backgroundColor: blue500,
            floating: true,
            snap: false,
            pinned: true,
            shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(24 * 2),
                bottomRight: Radius.circular(24 * 2),
              ),
            ),
            title: MyAppBar(),
            flexibleSpace: FlexibleSpaceBar(
              background: MyFlexibleAppBar(),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 32, right: 24, left: 24),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              "Video Pembelajaran 📚",
                              style: myTextTheme.headline3,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          SizedBox(
                            child: TextButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, VideoMenuPage.routeName);
                              },
                              child: Text(
                                "Lainnya",
                                style: GoogleFonts.roboto(
                                  textStyle: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 0.2,
                                      color: blue500),
                                ),
                              ),
                              style: TextButton.styleFrom(
                                minimumSize: Size.zero,
                                padding: EdgeInsets.zero,
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Belajar dimanapun dan kapanpun adik mau",
                          style: myTextTheme.bodyText2,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                const VideoRecentPage(),
                const SizedBox(
                  height: 32,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 24, left: 24),
                  child: ElevatedButton(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Ayo Latihan", //headline 3
                                    style: GoogleFonts.roboto(
                                      textStyle: const TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: 0,
                                          color: neutral100),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  Image.asset(
                                    "assets/icons/icon-latihan.png",
                                    width: 30.03,
                                    height: 29,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                "Belajar Menulis Huruf dan Angka",
                                style: myTextTheme.caption,
                              ),
                            ],
                          ),
                          SvgPicture.asset(
                            "assets/icons/chevron-right.svg",
                            color: neutral100,
                            height: 32,
                            width: 32,
                          ),
                        ],
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: blue500,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      minimumSize: Size.zero,
                      padding: EdgeInsets.zero,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, LatihanMenuPage.routeName);
                    },
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 24, left: 24),
                  child: Divider(
                    color: neutral200,
                    thickness: 1,
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 24, left: 24),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              "Info Webinar 📝",
                              style: myTextTheme.headline3,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          SizedBox(
                            child: TextButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, WebinarMenuPage.routeName);
                              },
                              child: Text(
                                "Lainnya",
                                style: GoogleFonts.roboto(
                                  textStyle: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 0.2,
                                      color: blue500),
                                ),
                              ),
                              style: TextButton.styleFrom(
                                minimumSize: Size.zero,
                                padding: EdgeInsets.zero,
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Lebih memahami kondisi adik",
                          style: myTextTheme.bodyText2,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                const CarouselWebinarRecentPage(),
                const SizedBox(
                  height: 24,
                ),
                const WebinarRecentPage(),
                const SizedBox(
                  height: 32,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 24, left: 24),
                  child: ElevatedButton(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Kiat Membimbing ✨", //headline 3
                                  style: GoogleFonts.roboto(
                                    textStyle: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 0,
                                        color: neutral100),
                                  ),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  "Untuk Ayah & Bunda Menemani Adik Belajar",
                                  style: myTextTheme.caption,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 0,
                            child: SvgPicture.asset(
                              "assets/icons/chevron-right.svg",
                              color: neutral100,
                              height: 32,
                              width: 32,
                            ),
                          ),
                        ],
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: blue500,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      minimumSize: Size.zero,
                      padding: EdgeInsets.zero,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, TipsPage.routeName);
                    },
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
