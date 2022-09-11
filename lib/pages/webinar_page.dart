import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unity_disleksia_platform/common/style.dart';
import 'package:unity_disleksia_platform/pages/webinars/webinar_search_page.dart';
import 'package:unity_disleksia_platform/pages/webinars/webinar_list_page.dart';

class WebinarPage extends StatefulWidget {
  static const routeName = '/webinarPage';

  const WebinarPage({Key? key}) : super(key: key);

  @override
  State<WebinarPage> createState() => _WebinarPageState();
}

class _WebinarPageState extends State<WebinarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Webinar',
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
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(
              <Widget>[
                Column(
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
                                  Navigator.pushNamed(
                                      context, WebinarSearchPage.routeName);
                                },
                                icon: SvgPicture.asset(
                                  "assets/icons/search.svg",
                                  color: neutral500,
                                  height: 24,
                                  width: 24,
                                ),
                                label: Text(
                                  "Cari Webinar",
                                  style: GoogleFonts.inter(
                                    textStyle: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        letterSpacing: -0.6,
                                        color: neutral500),
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.white,
                                  minimumSize: const Size.fromHeight(50),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0),
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
                    const SizedBox(
                      height: 24,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 24, left: 24, bottom: 14),
                      child: WebinarListPage(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
