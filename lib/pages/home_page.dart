import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:unity_disleksia_platform/common/style.dart';
import 'package:unity_disleksia_platform/data/api/api_service.dart';
import 'package:unity_disleksia_platform/data/model/banner_model.dart';
import 'package:unity_disleksia_platform/pages/carousel_webinar_recent_page.dart';
import 'package:unity_disleksia_platform/pages/latihan_menu_page.dart';
import 'package:unity_disleksia_platform/pages/latihan_page.dart';
import 'package:unity_disleksia_platform/pages/menu_page.dart';
import 'package:unity_disleksia_platform/pages/tips_page.dart';
import 'package:unity_disleksia_platform/pages/video_menu_page.dart';
import 'package:unity_disleksia_platform/pages/video_page.dart';
import 'package:unity_disleksia_platform/pages/video_recent_page.dart';
import 'package:unity_disleksia_platform/pages/webinar_menu_page.dart';
import 'package:unity_disleksia_platform/pages/webinar_recent_page.dart';
import 'package:unity_disleksia_platform/provider/video_recent_provider.dart';
import 'package:unity_disleksia_platform/provider/webinar_provider.dart';
import 'package:unity_disleksia_platform/provider/webinar_recent_provider.dart';
import 'package:unity_disleksia_platform/widgets/myappbar.dart';
import 'package:unity_disleksia_platform/widgets/myflexible_appbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];
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
                Padding(
                  padding: const EdgeInsets.only(top: 32, right: 24, left: 24),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Video Pembelajaran 📚",
                            style: myTextTheme.headline3,
                          ),
                          SizedBox(
                            child: TextButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, VideoMenuPage.routeName);
                              },
                              child: Text(
                                "Lainnya",
                                style: GoogleFonts.roboto(
                                  textStyle: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 0.2,
                                      color: blue500),
                                ),
                              ),
                              style: TextButton.styleFrom(
                                minimumSize: Size.zero,
                                padding: EdgeInsets.zero,
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Belajar dimanapun dan kapanpun adik mau",
                          style: myTextTheme.bodyText2,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                VideoRecentPage(),
                SizedBox(
                  height: 32,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 24, left: 24),
                  child: ElevatedButton(
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Ayo Latihan", //headline 3
                                    style: GoogleFonts.roboto(
                                      textStyle: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: 0,
                                          color: neutral100),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  Image.asset(
                                    "assets/icons/icon-latihan.png",
                                    width: 30.03,
                                    height: 29,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                "Belajar Menulis Huruf dan Angka",
                                style: myTextTheme.caption,
                              ),
                            ],
                          ),
                          SvgPicture.asset(
                            "assets/icons/chevron-right.svg",
                            color: neutral100,
                            height: 32,
                            width: 32,
                          ),
                        ],
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: blue500,
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(8),
                      ),
                      minimumSize: Size.zero,
                      padding: EdgeInsets.zero,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, LatihanMenuPage.routeName);
                    },
                  ),
                ),
                SizedBox(
                  height: 32,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 24, left: 24),
                  child: const Divider(
                    color: neutral200,
                    thickness: 1,
                  ),
                ),
                SizedBox(
                  height: 32,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 24, left: 24),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Info Webinar 📝",
                            style: myTextTheme.headline3,
                          ),
                          SizedBox(
                            child: TextButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, WebinarMenuPage.routeName);
                              },
                              child: Text(
                                "Lainnya",
                                style: GoogleFonts.roboto(
                                  textStyle: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 0.2,
                                      color: blue500),
                                ),
                              ),
                              style: TextButton.styleFrom(
                                minimumSize: Size.zero,
                                padding: EdgeInsets.zero,
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Lebih memahami kondisi adik",
                          style: myTextTheme.bodyText2,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                CarouselWebinarRecentPage(),
                // Padding(
                //   padding: const EdgeInsets.only(right: 24, left: 24),
                //   child: Container(
                //     child: CarouselSlider(
                //       options: CarouselOptions(
                //         height: 200,
                //         enlargeCenterPage: true,
                //         autoPlay: true,
                //         viewportFraction: 1.0,
                //       ),
                //       items: imgList
                //           .map(
                //             (item) => Container(
                //               child: Center(
                //                 child: ClipRRect(
                //                   borderRadius: BorderRadius.circular(8),
                //                   child: Stack(
                //                     children: [
                //                       Image.network(item,
                //                           fit: BoxFit.cover, width: 1000),
                //                       Container(
                //                         decoration: BoxDecoration(
                //                           borderRadius:
                //                               BorderRadius.circular(10),
                //                           gradient: LinearGradient(
                //                             begin: Alignment.bottomRight,
                //                             stops: [0.1, 0.9],
                //                             colors: [
                //                               Colors.black.withOpacity(.8),
                //                               Colors.black.withOpacity(.1)
                //                             ],
                //                           ),
                //                         ),
                //                       ),
                //                       Padding(
                //                         padding: const EdgeInsets.only(
                //                             bottom: 24, left: 24, right: 24),
                //                         child: Container(
                //                           alignment: Alignment.bottomLeft,
                //                           child: Expanded(
                //                             child: Text(
                //                               "Kenali Disleksia pada Anak di Masa Pandemi COVID-19",
                //                               style: GoogleFonts.roboto(
                //                                 textStyle: TextStyle(
                //                                     fontSize: 16,
                //                                     fontWeight: FontWeight.w500,
                //                                     letterSpacing: 0.2,
                //                                     color: neutral100),
                //                               ),
                //                             ),
                //                           ),
                //                         ),
                //                       ),
                //                     ],
                //                   ),
                //                 ),
                //               ),
                //             ),
                //           )
                //           .toList(),
                //     ),
                //   ),
                // ),
                const SizedBox(
                  height: 24,
                ),
                WebinarRecentPage(),
                const SizedBox(
                  height: 32,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 24, left: 24),
                  child: ElevatedButton(
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Kiat Membimbing ✨", //headline 3
                                  style: GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 0,
                                        color: neutral100),
                                  ),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  "Untuk Ayah & Bunda Menemani Adik Belajar",
                                  style: myTextTheme.caption,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 0,
                            child: SvgPicture.asset(
                              "assets/icons/chevron-right.svg",
                              color: neutral100,
                              height: 32,
                              width: 32,
                            ),
                          ),
                        ],
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: blue500,
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(8),
                      ),
                      minimumSize: Size.zero,
                      padding: EdgeInsets.zero,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, TipsPage.routeName);
                    },
                  ),
                ),
                SizedBox(
                  height: 32,
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
