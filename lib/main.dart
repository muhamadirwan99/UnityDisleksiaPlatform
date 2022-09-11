import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:provider/provider.dart';
import 'package:unity_disleksia_platform/common/navigation.dart';
import 'package:unity_disleksia_platform/common/style.dart';
import 'package:unity_disleksia_platform/data/api/api_service.dart';
import 'package:unity_disleksia_platform/data/db/database_webinar_helper.dart';
import 'package:unity_disleksia_platform/data/model/video_model.dart';
import 'package:unity_disleksia_platform/data/model/webinar_model.dart';
import 'package:unity_disleksia_platform/pages/latihan/angka_page.dart';
import 'package:unity_disleksia_platform/pages/bookmarks/bookmark_page.dart';
import 'package:unity_disleksia_platform/pages/videos/detail_video_page.dart';
import 'package:unity_disleksia_platform/pages/webinars/detail_webinar_page.dart';
import 'package:unity_disleksia_platform/pages/latihan/huruf_page.dart';
import 'package:unity_disleksia_platform/pages/latihan/instruksi_page.dart';
import 'package:unity_disleksia_platform/pages/latihan/latihan_angka_page.dart';
import 'package:unity_disleksia_platform/pages/latihan/latihan_huruf_page.dart';
import 'package:unity_disleksia_platform/pages/latihan/latihan_menu_page.dart';
import 'package:unity_disleksia_platform/pages/latihan_page.dart';
import 'package:unity_disleksia_platform/pages/menu_page.dart';
import 'package:unity_disleksia_platform/pages/videos/video_search_page.dart';
import 'package:unity_disleksia_platform/pages/webinars/webinar_search_page.dart';
import 'package:unity_disleksia_platform/pages/splash_page.dart';
import 'package:unity_disleksia_platform/pages/tips_page.dart';
import 'package:unity_disleksia_platform/pages/videos/video_menu_page.dart';
import 'package:unity_disleksia_platform/pages/video_page.dart';
import 'package:unity_disleksia_platform/pages/webinars/webinar_menu_page.dart';
import 'package:unity_disleksia_platform/pages/webinar_page.dart';
import 'package:unity_disleksia_platform/provider/database_video_provider.dart';
import 'package:unity_disleksia_platform/provider/database_webinar_provider.dart';
import 'package:unity_disleksia_platform/provider/kisah_provider.dart';
import 'package:unity_disleksia_platform/provider/search_video_provider.dart';
import 'package:unity_disleksia_platform/provider/search_webinar_provider.dart';
import 'package:unity_disleksia_platform/provider/tips_disleksia_provider.dart';
import 'package:unity_disleksia_platform/provider/tips_pembelajaran_provider.dart';
import 'package:unity_disleksia_platform/provider/tips_peningkatan_provider.dart';
import 'package:unity_disleksia_platform/provider/video_provider.dart';
import 'package:unity_disleksia_platform/provider/video_recent_provider.dart';
import 'package:unity_disleksia_platform/provider/webinar_provider.dart';
import 'package:unity_disleksia_platform/provider/webinar_recent_provider.dart';

import 'data/db/database_video_helper.dart';

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<VideoProvider>(
          create: (_) => VideoProvider(apiService: ApiService()),
        ),
        ChangeNotifierProvider<VideoRecentProvider>(
          create: (_) => VideoRecentProvider(apiService: ApiService()),
        ),
        ChangeNotifierProvider<WebinarProvider>(
          create: (_) => WebinarProvider(apiService: ApiService()),
        ),
        ChangeNotifierProvider<WebinarRecentProvider>(
          create: (_) => WebinarRecentProvider(apiService: ApiService()),
        ),
        ChangeNotifierProvider(
          create: (_) =>
              DatabaseVideoProvider(databaseHelper: DatabaseVideoHelper()),
        ),
        ChangeNotifierProvider(
          create: (_) =>
              DatabaseWebinarProvider(databaseHelper: DatabaseWebinarHelper()),
        ),
        ChangeNotifierProvider<SearchWebinarProvider>(
          create: (_) => SearchWebinarProvider(apiService: ApiService()),
        ),
        ChangeNotifierProvider<SearchVideoProvider>(
          create: (_) => SearchVideoProvider(apiService: ApiService()),
        ),
        ChangeNotifierProvider<TipsPembelajaranProvider>(
          create: (_) => TipsPembelajaranProvider(apiService: ApiService()),
        ),
        ChangeNotifierProvider<TipsPeningkatanProvider>(
          create: (_) => TipsPeningkatanProvider(apiService: ApiService()),
        ),
        ChangeNotifierProvider<TipsDisleksiaProvider>(
          create: (_) => TipsDisleksiaProvider(apiService: ApiService()),
        ),
        ChangeNotifierProvider<KisahProvider>(
          create: (_) => KisahProvider(apiService: ApiService()),
        ),
      ],
      child: MaterialApp(
        title: 'Unity Disleksia Platform',
        theme: ThemeData(
          primaryColor: blue500,
          colorScheme: ColorScheme.fromSwatch().copyWith(secondary: neutral100),
          appBarTheme: const AppBarTheme(
            backgroundColor: blue500,
          ),
          textTheme: myTextTheme,
        ),
        initialRoute: SplashPage.routeName,
        navigatorKey: navigatorKey,
        routes: {
          SplashPage.routeName: (context) => const SplashPage(),
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
          LatihanMenuPage.routeName: (context) => const LatihanMenuPage(),
          InstruksiPage.routeName: (context) => const InstruksiPage(),
          AngkaPage.routeName: (context) => const AngkaPage(),
          HurufPage.routeName: (context) => const HurufPage(),
          BookmarkPage.routeName: (context) => BookmarkPage(
                init: ModalRoute.of(context)?.settings.arguments as int,
              ),
          LatihanHurufPage.routeName: (context) => LatihanHurufPage(
                value: ModalRoute.of(context)?.settings.arguments as String,
              ),
          LatihanAngkaPage.routeName: (context) => LatihanAngkaPage(
                value: ModalRoute.of(context)?.settings.arguments as String,
              ),
          TipsPage.routeName: (context) => const TipsPage(),
          WebinarSearchPage.routeName: (context) => const WebinarSearchPage(),
          VideoSearchPage.routeName: (context) => const VideoSearchPage(),
        },
      ),
    );
  }
}
