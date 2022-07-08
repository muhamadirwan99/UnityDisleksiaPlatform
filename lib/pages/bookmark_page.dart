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
              Container(
                color: blue500,
                child: Padding(
                  padding: const EdgeInsets.only(
                      right: 24, left: 24, bottom: 16, top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 2,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            print("You pressed Icon Elevated Button");
                          },
                          icon: SvgPicture.asset(
                            "assets/icons/search.svg",
                            color: neutral500,
                            height: 24,
                            width: 24,
                          ),
                          label: Text(
                            "Pencarian",
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: -0.6,
                                  color: neutral500),
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            minimumSize: const Size.fromHeight(50),
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(12.0),
                            ),
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.only(
                                left: 16, right: 16, top: 12, bottom: 12),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
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
