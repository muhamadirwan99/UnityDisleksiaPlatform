import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unity_disleksia_platform/common/style.dart';
import 'package:unity_disleksia_platform/pages/tabs/video_tab.dart';
import 'package:unity_disleksia_platform/pages/tabs/webinar_tab.dart';

class BookmarkPage extends StatelessWidget {
  static const routeName = '/bookmarkPage';

  const BookmarkPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Bookmark',
              style: myTextTheme.headline5,
            ),
            titleTextStyle: const TextStyle(color: neutral100),
            elevation: 0,
            backgroundColor: blue500,
            leading: IconButton(
              icon: SvgPicture.asset(
                "assets/icons/arrow-left.svg",
                color: neutral100,
                height: 32,
                width: 32,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: Column(
            children: [
              Material(
                color: blue500,
                child: TabBar(
                  tabs: [Tab(text: "Video"), Tab(text: "Webinar")],
                  indicatorColor: neutral100,
                ),
              ),
              Expanded(
                child: TabBarView(children: [
                  VideoTab(),
                  WebinarTab(),
                ]),
              ),
            ],
          )),
    );
  }
}
