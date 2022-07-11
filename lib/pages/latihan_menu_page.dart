import 'package:flutter/material.dart';
import 'package:unity_disleksia_platform/common/style.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:unity_disleksia_platform/pages/home_page.dart';
import 'package:unity_disleksia_platform/pages/latihan_page.dart';
import 'package:unity_disleksia_platform/pages/tips_page.dart';
import 'package:unity_disleksia_platform/pages/video_page.dart';
import 'package:unity_disleksia_platform/pages/webinar_page.dart';

class LatihanMenuPage extends StatefulWidget {
  static const routeName = '/latihanMenuPage';

  const LatihanMenuPage();

  @override
  State<LatihanMenuPage> createState() => _LatihanMenuPageState();
}

class _LatihanMenuPageState extends State<LatihanMenuPage> {
  int currentIndex = 2;
  final screens = [
    HomePage(),
    VideoPage(),
    LatihanPage(),
    WebinarPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Color(0xffCECECE),
                spreadRadius: 2,
                blurRadius: 12,
                offset: Offset(2, 2)),
          ],
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          onTap: (index) => setState(() => currentIndex = index),
          selectedLabelStyle: myTextTheme.bodyText2,
          unselectedLabelStyle: myTextTheme.bodyText2,
          selectedItemColor: blue500,
          items: [
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 2),
                child: SvgPicture.asset(
                  "assets/icons/home.svg",
                  color: neutral400,
                ),
              ),
              activeIcon: Padding(
                padding: const EdgeInsets.only(bottom: 2),
                child: SvgPicture.asset(
                  "assets/icons/home.svg",
                  color: blue500,
                ),
              ),
              label: "Beranda",
              backgroundColor: neutral400,
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 2),
                child: SvgPicture.asset(
                  "assets/icons/video.svg",
                  color: neutral400,
                ),
              ),
              activeIcon: Padding(
                padding: const EdgeInsets.only(bottom: 2),
                child: SvgPicture.asset(
                  "assets/icons/video.svg",
                  color: blue500,
                ),
              ),
              label: 'Video',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 2),
                child: SvgPicture.asset(
                  "assets/icons/latihan.svg",
                  color: neutral400,
                ),
              ),
              activeIcon: Padding(
                padding: const EdgeInsets.only(bottom: 2),
                child: SvgPicture.asset(
                  "assets/icons/latihan.svg",
                  color: blue500,
                ),
              ),
              label: 'Latihan',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 2),
                child: SvgPicture.asset(
                  "assets/icons/webinar.svg",
                  color: neutral400,
                ),
              ),
              activeIcon: Padding(
                padding: const EdgeInsets.only(bottom: 2),
                child: SvgPicture.asset(
                  "assets/icons/webinar.svg",
                  color: blue500,
                ),
              ),
              label: 'Webinar',
            ),
          ],
        ),
      ),
    );
  }
}
