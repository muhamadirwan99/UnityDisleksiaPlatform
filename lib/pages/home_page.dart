import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:unity_disleksia_platform/common/style.dart';
import 'package:unity_disleksia_platform/pages/inspiratif/carousel_inspiratif_story_page.dart';
import 'package:unity_disleksia_platform/pages/inspiratif/inspiratif_story_page.dart';
import 'package:unity_disleksia_platform/pages/latihan_page.dart';
import 'package:unity_disleksia_platform/pages/tips_page.dart';
import 'package:unity_disleksia_platform/pages/video_page.dart';
import 'package:unity_disleksia_platform/pages/webinar_page.dart';
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
                const SizedBox(
                  height: 24,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 24, left: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              "assets/icons/video-pembelajaran.svg",
                              height: 72,
                              width: 72,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              "Video\nPembelajaran",
                              style: myTextTheme.caption,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, VideoPage.routeName);
                        },
                      ),
                      GestureDetector(
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              "assets/icons/latihan-menulis.svg",
                              height: 72,
                              width: 72,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              "Latihan\nMenulis",
                              style: myTextTheme.caption,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, LatihanPage.routeName);
                        },
                      ),
                      GestureDetector(
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              "assets/icons/kiat-membimbing.svg",
                              height: 72,
                              width: 72,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              "Kiat\nMembimbing",
                              style: myTextTheme.caption,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, TipsPage.routeName);
                        },
                      ),
                      GestureDetector(
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              "assets/icons/info-webinar.svg",
                              height: 72,
                              width: 72,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              "Info\nWebinar",
                              style: myTextTheme.caption,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, WebinarPage.routeName);
                        },
                      ),
                    ],
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
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Kisah Inspiratif",
                            style: myTextTheme.headline3,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          SvgPicture.asset(
                            "assets/icons/news.svg",
                            height: 24,
                            width: 24,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Lebih percaya diri dan positif",
                          style: myTextTheme.bodyText2,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                const CarouselInspiratifStoryPage(),
                const SizedBox(
                  height: 24,
                ),
                const InspiratifStoryPage(),
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
