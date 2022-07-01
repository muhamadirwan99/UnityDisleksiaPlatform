import 'package:flutter/material.dart';
import 'package:unity_disleksia_platform/common/style.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:unity_disleksia_platform/pages/home_page.dart';
import 'package:unity_disleksia_platform/pages/tips_page.dart';
import 'package:unity_disleksia_platform/pages/video_page.dart';
import 'package:unity_disleksia_platform/pages/webinar_page.dart';

class WebinarMenuPage extends StatefulWidget {
  static const routeName = '/webinarMenuPage';

  const WebinarMenuPage();

  @override
  State<WebinarMenuPage> createState() => _WebinarMenuPageState();
}

class _WebinarMenuPageState extends State<WebinarMenuPage> {
  int currentIndex = 2;
  final screens = [
    HomePage(),
    VideoPage(),
    WebinarPage(),
    TipsPage(),
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
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(24), topLeft: Radius.circular(24)),
          boxShadow: [
            BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24.0),
            topRight: Radius.circular(24.0),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: currentIndex,
            onTap: (index) => setState(() => currentIndex = index),
            selectedLabelStyle: myTextTheme.headline6,
            unselectedLabelStyle: myTextTheme.headline6,
            selectedItemColor: blue500,
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/icons/home.svg",
                  color: neutral400,
                ),
                activeIcon: SvgPicture.asset(
                  "assets/icons/home.svg",
                  color: blue500,
                ),
                label: "Beranda",
                backgroundColor: neutral400,
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/icons/video.svg",
                  color: neutral400,
                ),
                activeIcon: SvgPicture.asset(
                  "assets/icons/video.svg",
                  color: blue500,
                ),
                label: 'Video',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/icons/webinar.svg",
                  color: neutral400,
                ),
                activeIcon: SvgPicture.asset(
                  "assets/icons/webinar.svg",
                  color: blue500,
                ),
                label: 'Webinar',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/icons/tips.svg",
                  color: neutral400,
                ),
                activeIcon: SvgPicture.asset(
                  "assets/icons/tips.svg",
                  color: blue500,
                ),
                label: 'Tips & Trik',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
