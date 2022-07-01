import 'package:flutter/material.dart';
import 'package:unity_disleksia_platform/common/navigation.dart';
import 'package:unity_disleksia_platform/common/style.dart';
import 'package:unity_disleksia_platform/data/model/video_model.dart';
import 'package:unity_disleksia_platform/data/model/webinar_model.dart';
import 'package:unity_disleksia_platform/pages/detail_video_page.dart';
import 'package:unity_disleksia_platform/pages/detail_webinar_page.dart';
import 'package:unity_disleksia_platform/pages/menu_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Unity Disleksia Platform',
      theme: ThemeData(
        primaryColor: blue500,
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: neutral100),
        appBarTheme: const AppBarTheme(
          backgroundColor: blue500,
        ),
        textTheme: myTextTheme,
      ),
      initialRoute: MenuPage.routeName,
      navigatorKey: navigatorKey,
      routes: {
        MenuPage.routeName: (context) => const MenuPage(),
        DetailVideoPage.routeName: (context) => DetailVideoPage(
              video: ModalRoute.of(context)?.settings.arguments as Video,
            ),
        DetailWebinarPage.routeName: (context) => DetailWebinarPage(
              webinar: ModalRoute.of(context)?.settings.arguments as Webinar,
            ),
      },
    );
  }
}
