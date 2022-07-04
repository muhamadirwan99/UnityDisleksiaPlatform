import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:unity_disleksia_platform/common/style.dart';
import 'package:unity_disleksia_platform/data/api/api_service.dart';
import 'package:unity_disleksia_platform/pages/menu_page.dart';
import 'package:unity_disleksia_platform/pages/webinar_list_page.dart';
import 'package:unity_disleksia_platform/provider/webinar_provider.dart';

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
          style: myTextTheme.headline3,
        ),
        titleTextStyle: const TextStyle(color: neutral900),
        elevation: 0,
        backgroundColor: neutral100,
        leading: IconButton(
          icon: SvgPicture.asset(
            "assets/icons/arrow-left.svg",
            color: neutral900,
            height: 32,
            width: 32,
          ),
          onPressed: () {
            Navigator.pushNamed(context, MenuPage.routeName);
          },
        ),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(
              <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                      top: 16, right: 24, left: 24, bottom: 14),
                  child: Column(
                    children: [
                      Row(
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
                          // SizedBox(
                          //   width: 16,
                          // ),
                          // Expanded(
                          //   flex: 0,
                          //   child: Container(
                          //     width: 48,
                          //     height: 48,
                          //     decoration: BoxDecoration(
                          //       borderRadius: BorderRadius.circular(4),
                          //       color: blue600,
                          //     ),
                          //     child: Center(
                          //       child: SvgPicture.asset(
                          //         "assets/icons/grid.svg",
                          //         color: neutral100,
                          //         height: 32,
                          //         width: 32,
                          //       ),
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      ChangeNotifierProvider<WebinarProvider>(
                        create: (_) =>
                            WebinarProvider(apiService: ApiService()),
                        child: WebinarListPage(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
