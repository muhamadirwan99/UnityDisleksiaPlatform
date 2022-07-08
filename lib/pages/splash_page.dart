import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'package:unity_disleksia_platform/common/style.dart';
import 'package:unity_disleksia_platform/pages/menu_page.dart';

class SplashPage extends StatelessWidget {
  static const routeName = '/splashPage';
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SplashScreenView(
      navigateRoute: const MenuPage(),
      duration: 4000,
      imageSrc: "assets/icons/logo.png",
      backgroundColor: neutral100,
    ));
  }
}
