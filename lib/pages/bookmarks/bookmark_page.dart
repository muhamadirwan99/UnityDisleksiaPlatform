import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:unity_disleksia_platform/common/style.dart';
import 'package:unity_disleksia_platform/pages/bookmarks/tabs/video_tab.dart';
import 'package:unity_disleksia_platform/pages/bookmarks/tabs/webinar_tab.dart';

// ignore: must_be_immutable
class BookmarkPage extends StatelessWidget {
  static const routeName = '/bookmarkPage';

  int? init;

  BookmarkPage({Key? key, required this.init}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: init ?? 0,
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
            children: const [
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
