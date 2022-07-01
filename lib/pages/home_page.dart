import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:unity_disleksia_platform/common/style.dart';
import 'package:unity_disleksia_platform/data/api/api_service.dart';
import 'package:unity_disleksia_platform/data/model/banner_model.dart';
import 'package:unity_disleksia_platform/pages/video_recent_page.dart';
import 'package:unity_disleksia_platform/pages/webinar_recent_page.dart';
import 'package:unity_disleksia_platform/provider/video_recent_provider.dart';
import 'package:unity_disleksia_platform/provider/webinar_provider.dart';
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
                Banner(),
                Padding(
                  padding: const EdgeInsets.only(top: 24, right: 24, left: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Video Terbaru 🔥",
                        style: myTextTheme.headline3,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Lainnya",
                          style: GoogleFonts.inter(
                            textStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                letterSpacing: -0.5,
                                color: blue500),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                ChangeNotifierProvider<VideoRecentProvider>(
                  create: (_) => VideoRecentProvider(apiService: ApiService()),
                  child: VideoRecentPage(),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 24, right: 24, left: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Webinar 📚",
                        style: myTextTheme.headline3,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Lainnya",
                          style: GoogleFonts.inter(
                            textStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                letterSpacing: -0.5,
                                color: blue500),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                ChangeNotifierProvider<WebinarProvider>(
                  create: (_) => WebinarProvider(apiService: ApiService()),
                  child: WebinarRecentPage(),
                ),
                SizedBox(
                  height: 24,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  SizedBox Banner() {
    return SizedBox(
      height: 180,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(top: 32, left: 24, right: 8),
        children: bannerList.imageUrls.map((url) {
          return Padding(
            padding: const EdgeInsets.only(right: 16),
            child: ClipRRect(
              // borderRadius: BorderRadius.circular(10),
              child: Image.network(url),
            ),
          );
        }).toList(),
      ),
    );
  }
}
