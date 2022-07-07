import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:unity_disleksia_platform/common/navigation.dart';
import 'package:unity_disleksia_platform/common/style.dart';
import 'package:unity_disleksia_platform/data/model/video_model.dart';
import 'package:unity_disleksia_platform/data/model/webinar_model.dart';
import 'package:unity_disleksia_platform/pages/angka_page.dart';
import 'package:unity_disleksia_platform/pages/bookmark_page.dart';
import 'package:unity_disleksia_platform/pages/detail_video_page.dart';
import 'package:unity_disleksia_platform/pages/detail_webinar_page.dart';
import 'package:unity_disleksia_platform/pages/huruf_page.dart';
import 'package:unity_disleksia_platform/pages/instruksi_page.dart';
import 'package:unity_disleksia_platform/pages/latihan_angka_page.dart';
import 'package:unity_disleksia_platform/pages/latihan_huruf_page.dart';
import 'package:unity_disleksia_platform/pages/latihan_page.dart';
import 'package:unity_disleksia_platform/pages/menu_page.dart';
import 'package:unity_disleksia_platform/pages/tips_page.dart';
import 'package:unity_disleksia_platform/pages/video_menu_page.dart';
import 'package:unity_disleksia_platform/pages/video_page.dart';
import 'package:unity_disleksia_platform/pages/webinar_menu_page.dart';
import 'package:unity_disleksia_platform/pages/webinar_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterDownloader.initialize(debug: true, ignoreSsl: true);

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
        VideoPage.routeName: (context) => const VideoPage(),
        VideoMenuPage.routeName: (context) => const VideoMenuPage(),
        DetailVideoPage.routeName: (context) => DetailVideoPage(
              video: ModalRoute.of(context)?.settings.arguments as Video,
            ),
        WebinarPage.routeName: (context) => const WebinarPage(),
        WebinarMenuPage.routeName: (context) => const WebinarMenuPage(),
        DetailWebinarPage.routeName: (context) => DetailWebinarPage(
              webinar: ModalRoute.of(context)?.settings.arguments as Webinar,
            ),
        LatihanPage.routeName: (context) => const LatihanPage(),
        InstruksiPage.routeName: (context) => const InstruksiPage(),
        AngkaPage.routeName: (context) => const AngkaPage(),
        HurufPage.routeName: (context) => const HurufPage(),
        BookmarkPage.routeName: (context) => const BookmarkPage(),
        LatihanHurufPage.routeName: (context) => LatihanHurufPage(
              value: ModalRoute.of(context)?.settings.arguments as String,
            ),
        LatihanAngkaPage.routeName: (context) => LatihanAngkaPage(
              value: ModalRoute.of(context)?.settings.arguments as String,
            ),
        TipsPage.routeName: (context) => const TipsPage(),
      },
    );
  }
}
