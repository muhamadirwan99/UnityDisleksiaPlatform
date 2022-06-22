import 'package:flutter/material.dart';
import 'package:unity_disleksia_platform/common/style.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MenuPage extends StatefulWidget {
  static const routeName = '/menuPage';
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("test"),
      ),
      body: Center(
        child: Text("home"),
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
            selectedLabelStyle: myTextTheme.subtitle2,
            unselectedLabelStyle: myTextTheme.subtitle2,
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
